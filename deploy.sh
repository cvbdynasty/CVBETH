arr=("cvbsz"  "cvbsh"  "cvbbj" )
for v in ${arr[@]}
do
	echo "depoly $v"
	scp docker-compose.yml zengym@$v:~/;
	ssh zengym@$v mkdir ~/data/geth -p;
	scp data/static-nodes.json zengym@$v:~/data/geth/
	ssh zengym@$v  " docker-compose down;sudo rm ~/data/geth/*data -rf;docker pull enochi/cvb;"
done
for v in ${arr[@]}
do
	echo "run $v"
	ssh zengym@$v docker-compose up -d
done

