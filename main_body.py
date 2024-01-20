import WorkforceData
import pyomo.environ as pyo
from pyomo.opt import SolverFactory
import pyomo_sens_analysis as pyo_SA

#construct the model

model = pyo.ConcreteModel('C2')

#sets

model.I = pyo.Set(initialize = WorkforceData.worker_type, doc = 'workertype')
model.J = pyo.Set(initialize = WorkforceData.years, doc = 'years')

#parameters

model.pR = pyo.Param(model.I, model.J, initialize = WorkforceData.requirements, doc = 'workforce requirements for each i type workforce for year j')
model.pB = pyo.Param(model.I, initialize = WorkforceData.beginning_workforce, doc = 'beginning workforce of the first year')
model.pHl = pyo.Param(model.I, initialize = WorkforceData.hiring_limit, doc = 'yearly hiring limit for each type of workforce')
model.pHc = pyo.Param(model.I, initialize = WorkforceData.hiring_cost, doc = 'hiring cost of each type of workforce')
model.pI = pyo.Param(model.I, initialize = WorkforceData.idle, doc = 'idle cost')
model.pO = pyo.Param(model.I, initialize = WorkforceData.outsorcing_cost, doc = 'outsorcing cost')
model.pT =  pyo.Param(model.I, initialize = WorkforceData.part_time_cost, doc = 'part time cost')

#desicion variables 

model.vXh = pyo.Var(model.I, model.J, bounds=(0.0,None), doc='number of i type workers hired in year j', within=pyo.NonNegativeReals)
model.vP = pyo.Var(model.I, model.J, bounds=(0.0,None), doc='number of i type workers promoted in year j', within=pyo.NonNegativeReals)
model.vD = pyo.Var(model.I, model.J, bounds=(0.0,None), doc='number of i type workers degraded in year j', within=pyo.NonNegativeReals)
model.vI = pyo.Var(model.I, model.J, bounds=(0.0,None), doc='number of i type idle workers in year j', within=pyo.NonNegativeReals)
model.vO = pyo.Var(model.I, model.J, bounds=(0.0,None), doc='number of i type outsourced workers hired in year j', within=pyo.NonNegativeReals)
model.vT = pyo.Var(model.I, model.J, bounds=(0.0,None), doc='number of i type part-time workers  hired in year j', within=pyo.NonNegativeReals)
model.vW = pyo.Var(model.I, model.J, bounds=(0.0,None), doc='Workforce of i type workers in year j', within=pyo.NonNegativeReals)


def eWorkforce_A(model,j): 
    if j == 0:
        return ((model.pB[0]) + model.vXh[0,j] + model.vP[1,j] - model.vD[0,j]) == model.vW[0,j]
    else:
        return ((model.vW[0,j-1] * 0.95)  + model.vXh[0,j] + model.vP[1,j] - model.vD[0,j]) == model.vW[0,j]

model.eWorkforce_A = pyo.Constraint(model.J, rule = eWorkforce_A, doc = 'Workforce constraint for A')

def eWorkforce_B(model,j):
    if j == 0:
        return ((model.pB[1]) + model.vXh[1,j] + (model.vD[0,j]*0.5) + model.vP[2,j] - model.vP[1,j] - model.vD[1,j]) == model.vW[1,j]
    else:
        return ((model.vW[1,j-1] * 0.95) + model.vXh[1,j] + (model.vD[0,j]*0.5) + model.vP[2,j] - model.vP[1,j] - model.vD[1,j]) == model.vW[1,j]
        
model.eWorkforce_B = pyo.Constraint(model.J, rule = eWorkforce_B, doc = 'Workforce constraint for B')
        
def eWorkforce_C(model,j):
    if j == 0:
        return ((model.pB[2]) + model.vXh[2,j] + (model.vD[1,j]*0.5) - model.vP[2,j]) == model.vW[2,j]
    else:
        return ((model.vW[2,j-1] * 0.90) + model.vXh[2,j] + (model.vD[1,j]*0.5) - model.vP[2,j]) == model.vW[2,j]

model.eWorkforce_C = pyo.Constraint(model.J, rule = eWorkforce_C, doc = 'Workforce constraint for C')


def eRequirement(model,i,j):
    return model.vW[i,j] - model.vI[i,j] +  model.vO[i,j] + (model.vT[i,j] * 0.5) == model.pR[i,j]

model.eRequirement = pyo.Constraint(model.I, model.J, rule = eRequirement, doc = 'Workforce requirement for i type of workforce in year j') 

def eHiring(model,i,j):
    return model.vXh[i,j] <= model.pHl[i]

model.eHiring = pyo.Constraint(model.I, model.J, rule = eHiring, doc = 'Maximum number of i type workers can be hired in year j')

def eCtoB(model,j):
    return  model.vP[2,j] <= 300

model.eCtoB = pyo.Constraint(model.J, rule = eCtoB, doc = 'Constraint for maximum number of C type workers promoted')

def eBtoA(model,j):
    if j == 0:
        return model.vP[1,j] <= (model.pB[1]*0.2)
    else:
        return model.vP[1,j] <= (model.vW[1,j-1]*0.2)
    
model.eBtoA = pyo.Constraint(model.J, rule = eBtoA, doc = 'Constraint for maximum number of B type workers promoted')       

def eOutsource(model,j):
    return sum(model.vO[i,j] for i in model.I) <= 175

model.eOutsource = pyo.Constraint(model.J, rule = eOutsource, doc = 'Maximum amount of outsource workforce')  

def ePartTime(model,j):
    return sum(model.vT[i,j] for i in model.I) <= 80

model.ePartTime = pyo.Constraint(model.J, rule = ePartTime, doc = 'Maximum amount of parttime workforce')
       
"""def oTotal_Cost(model):
    return sum(model.pHc[i]*model.vXh[i,j] for i in model.I for j in model.J) + sum(model.vP[1,j]*300 for j in model.J) + sum(model.vP[2,j]*400 for j in model.J) + sum(model.pI[i]*model.vI[i,j] for i in model.I for j in model.J) + sum(model.pO[i]*model.vO[i,j] for i in model.I for j in model.J) + sum(model.pT[i]*model.vT[i,j] for i in model.I for j in model.J)  
model.oTotal_Cost = pyo.Objective(rule=oTotal_Cost,sense=pyo.minimize, doc = 'total cost')
"""
"""def oTotal_Cost(model):
    return sum(model.pHc[i]*model.vXh[i,j] for i in model.I for j in model.J) + sum(model.vP[1,j]*300 for j in model.J) + sum(model.vP[2,j]*400 for j in model.J) + sum(model.pI[i]*model.vI[i,j] for i in model.I for j in model.J) + sum(model.pO[i]*model.vO[i,j] for i in model.I for j in model.J) + sum(model.pT[i]*model.vT[i,j] for i in model.I for j in model.J) <= 3200000 
""""model.oTotal_Cost = pyo.Constraint(rule=oTotal_Cost, doc = 'total cost')"""


model.vTotal_Cost = pyo.Var(bounds = (0.0,None))
def eTotal_Cost(model):
    return model.vTotal_Cost == sum(model.pHc[i]*model.vXh[i,j] for i in model.I for j in model.J) + sum(model.vP[1,j]*300 for j in model.J) + sum(model.vP[2,j]*400 for j in model.J) + sum(model.pI[i]*model.vI[i,j] for i in model.I for j in model.J) + sum(model.pO[i]*model.vO[i,j] for i in model.I for j in model.J) + sum(model.pT[i]*model.vT[i,j] for i in model.I for j in model.J)  

model.eTotal_Cost = pyo.Constraint(rule = eTotal_Cost)


def eIdle(model):
    return sum(model.vI[i,j] for i in model.I for j in model.J)

model.eIdle = pyo.Objective(rule = eIdle, sense = pyo.minimize, doc='total idleness')








"""def oMin_Idle(model):
    return sum(model.pI[i]*model.vI[i,j] for i in model.I for j in model.J)
model.oMin_Idle = pyo.Objective(rule = oMin_Idle, sense = pyo.minimize, doc = 'minimize idle')
"""



#Export the open form of the model with the user defined labels
model.write('model_labels.lp', io_options={'symbolic_solver_labels': True})
#Export the open form of the model without the user defined labels
model.write('model_nolabels.lp', io_options={'symbolic_solver_labels': False})
#shadow prices of the constraints
model.dual = pyo.Suffix(direction=pyo.Suffix.IMPORT)
#reduced costs of the objective function coefficients
model.rc = pyo.Suffix(direction=pyo.Suffix.IMPORT)
#Assign GLPK as the solver
Solver = SolverFactory('glpk')
#Print the sensitivity analysis and output report
#Solver.options['ranges'] = r"C:\Users\Emir\Desktop\case2\SA_Report.txt"
SolverResults = Solver.solve(model, tee=True)
#model.vIdle.display()
model.vTotal_Cost.display()
model.eIdle.display()
#pyo_SA.reorganize_SA_report(file_path_SA = r"C:\Users\Emir\Desktop\case2\SA_Report.txt", file_path_LP_labels = r"C:\Users\Emir\Desktop\case2\model_labels.lp", file_path_LP_nolabels = r"C:\Users\Emir\Desktop\case2\model_nolabels.lp")
        
    