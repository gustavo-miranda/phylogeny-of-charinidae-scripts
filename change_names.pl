# These are commands to change the name of tips in a phylogenetic tree in a fast way.
# You need to cd to the directory where the tree is stored and run the Perl command.
# Depending on the format of the tree (nex or phy), this bit of the code "*.nex" needs to be changed accordingly.
# This works like a 'find and replace' tool, so the first name is the one to be matched (the name in the tree) and the second is the new name.
# This works in Unix environment (so in a Mac or Linux OS).
# You can also create a loop to automate the run, but then you need to creat a list of configuration file.

perl -pi -w -e 's/davidovi11377/"Weygoldtia davidovi 11377"/g;' *.nex
perl -pi -w -e 's/diadema1479/"Damon diadema 1479"/g;' *.nex
perl -pi -w -e 's/dominican10473/"Charinus dominicanus 10473"/g;' *.nex
perl -pi -w -e 's/gertschil10076/"Charinus gertschi 10076"/g;' *.nex
perl -pi -w -e 's/giganteus3509/"Mastigoproctus giganteus 3509"/g;' *.nex
perl -pi -w -e 's/ioanniticus2843/"Sarax ioanniticus 2843"/g;' *.nex
perl -pi -w -e 's/longipes1483/"Phrynus longipes 1483"/g;' *.nex
perl -pi -w -e 's/neocaledon5174/"Charinus neocaledonicus 5174"/g;' *.nex
perl -pi -w -e 's/pescotti6367/"Charinus pescotti 6367"/g;' *.nex
perl -pi -w -e 's/potiguar13398/"Charinus potiguar 13398"/g;' *.nex
perl -pi -w -e 's/reddelli13402/"Charinus reddelli 13402"/g;' *.nex
perl -pi -w -e 's/S_huberi/"Sarax huberi"/g;' *.nex
perl -pi -w -e 's/S_javensis/"Sarax javensis"/g;' *.nex
perl -pi -w -e 's/S_willeyi/"Sarax willeyi"/g;' *.nex
perl -pi -w -e 's/seychellaru9074/"Sarax seychellarum 9074"/g;' *.nex
perl -pi -w -e 's/sillami13448/"Charinus sillami 13448"/g;' *.nex
perl -pi -w -e 's/taboa13400/"Charinus taboa 13400"/g;' *.nex
perl -pi -w -e 's/victori10170/"Charinus aguayoi 10170"/g;' *.nex
perl -pi -w -e 's/vulgaris13396/"Charinus vulgaris 13396"/g;' *.nex
perl -pi -w -e 's/yayukae12109/"Sarax yayukae 12109"/g;' *.nex
perl -pi -w -e 's/yayukae12119/"Sarax yayukae 12119"/g;' *.nex
