import maya.OpenMaya as om
import maya.cmds as cmds

if not 'c' in globals():
    globals()['c'] = 0

def set_contloler(c_name,j_name):
    joint_name=[]
    selection_joint=om.MSelectionList()
    om.MGlobal.getActiveSelectionList(selection_joint)

    dag_path=om.MDagPath()

    selection_joint.getDagPath(0, dag_path)
    

    joint_fn = om.MFnTransform(dag_path)
    joint_name=dag_path.partialPathName()

    joint_position = joint_fn.translation(om.MSpace.kWorld)
    
    new_position=joint_position
    
    global c
    c+=1
    co=str(c)
    contname=c_name+co
    testcontloller=cmds.circle(name=contname)
    
    groupname=c_name +co+ "_GRP"
    
    group_node=cmds.group (em=True,name=groupname)

    cmds.select(contname,replace=True)
    cmds.select(groupname,add=True)
    cmds.parent(relative=True)
    cmds.select(groupname,replace=True)

    
    target_transform=om.MSelectionList()
    om.MGlobal.getActiveSelectionList(target_transform)

    target_dag_path=om.MDagPath()
    

    target_transform.getDagPath(0, target_dag_path)
    
    target_transform = om.MFnTransform(target_dag_path)
    

    target_transform.setTranslation(joint_position,om.MSpace.kWorld)
    
    
    cmds.select(joint_name,add=True)
    
    cmds.parent(relative=True)
    
    setarray=(0.0,0.0,0.0)
    setrotate=90
    
    cmds.setAttr(groupname + '.translateX', setarray[0])
    cmds.setAttr(groupname + '.translateY', setarray[0])
    cmds.setAttr(groupname + '.translateZ', setarray[0])
    cmds.setAttr(groupname + '.rotateY',setrotate)
    
    cmds.makeIdentity(groupname,apply=True,rotate=True)
    
    cmds.parent(groupname,w=True)
    
    
contlolername="contloler"
name2="testchar" 
        
set_contloler(contlolername,name2)