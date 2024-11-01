import maya.cmds as cmds

#names = リネーム名　addOnly =名前の追加　addnames = 追加の名前 
names = "rename"

addOnly = False
addnames = "_High"

#Groupとメッシュを同時に選ぶとaddnames動きません（リネームは化）
#Addnames does not work when selecting the group and mesh at the same time (renaming is done)

#maked : SEG_Other
#Gmail: seg4r8other@gmail.com
#2024/10/30


###########-WARNING-#############
selection = cmds.ls(selection = True,long=True)

if cmds.objExists(selection[0]):
    cnts = 1
    for i in selection:
        cn = str(cnts)
        ob = i
        cmds.select(i)
        r = names + "00"+cn

        if not addOnly:
            cmds.select(i)
            cmds.rename(r)
        
        else :
            print(ob)
            short_name = ob.rsplit('|', 1)[-1]
            new_name = cmds.rename(ob, short_name + addnames)
            print(f"Renamed {ob} to {new_name}")
                    
        cnts += 1