python3 train_local.py data/train$1;
python3 formattrainingdata.py data/$1\.local.training;
~/Tools/libsvm/svm-train -q -b 1 -c 100 data/$1\.local.data data/$1\.local.m ;
python3 train_global.py data/train$1 data/$1\.local.m;
~/Tools/libsvm/svm-train -q -b 1 -c 1000 data/$1\.global.data data/$1\.global.m ;
python3 inference.py data/test$1 data/$1\.local.m data/$1\.global.m | tee results/fold$1\.txt ;

