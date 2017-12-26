#!bin/bash


if [ "$1" = "" ]
then
    echo "ERROR : No argument"
	exit 1
fi

cd $1

mecab=mecab-0.996
curl -L -o ${mecab}.tar.gz "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE"
tar xvf ${mecab}.tar.gz
pushd ${mecab}
./configure prefix=`pwd` --with-charset=utf8
make prefix=`pwd`
make check
make install
popd
rm ${mecab}.tar.gz

dic=mecab-ipadic-2.7.0-20070801
curl -L -o ${dic}.tar.gz "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM"
tar xvf ${dic}.tar.gz
pushd ${dic}
./configure prefix=`pwd` --with-mecab-config=../${mecab}/bin/mecab-config --with-charset=utf8
make prefix=`pwd`
make install
popd
rm ${dic}.tar.gz
