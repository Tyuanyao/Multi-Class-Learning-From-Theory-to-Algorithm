addpath( './utils' );
addpath('../libsvm/libsvm-3.22/matlab/')
clear
close all
% datasets={'plant','psortPos', 'psortNeg', 'nonpl', 'sector', 'segment','vehicle','vowel','wine','dna','glass','iris', 'svmguide2','satimage', 'usps'};

datasets={'iris'};
C_list=10.^(0:1:3);
gamma_list= 10.^(-4:1:-2);

train_part = 0.8;
rounds=50;
folds=10;
all_results=zeros(rounds, length(datasets));
for j=1:length(datasets)
    [KMatrix, label_vector, localR] = load_kernels(char(datasets(j)), 'smsd');    
    sample_n=length(label_vector);
    
    best_para = get_best_para(KMatrix, label_vector, {C_list,gamma_list, localR}, 'smsd', folds);
    fprintf('best C is %.2f and best gamma is %.6f\n',best_para(1), best_para(2));
    
    rand('state', 0);
    for i=1:rounds
        rand_arr = randperm(sample_n);
        
        train_array=rand_arr(1:int64(sample_n*train_part));
        test_array=rand_arr(int64(sample_n*train_part)+1:sample_n);
        
        Ktrain=KMatrix(train_array,train_array,:);
        Ktest=KMatrix(train_array,test_array,:);
        Ytrain=label_vector(train_array);
        Ytest=label_vector(test_array);
        
        all_results(i, j)=single_smsd(Ktrain, Ytrain, Ktest, Ytest, localR, best_para(1), best_para(2));
        fprintf('for %s round:%2d acc:%.2f\n',char(datasets(j)), i, all_results(i, j));
    end
    fprintf('mean acc of %s is %.2f and best C is %.2f, gamma is %.6f\n ',char(datasets(j)), mean(all_results(:,j)), best_para(1), best_para(2));
end
