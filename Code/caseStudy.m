clc;              
clear;            % clear all workspace variables
close all;        % close all windows
  
currentFolder = pwd;              
addpath(genpath(currentFolder));
%% load dataset 1
% load('datasets/Dataset1/disSim_Jaccard.mat');
% load('datasets/Dataset1/lncSim.mat');
% load('datasets/Dataset1/interMatrix.mat');
% lncR_sim_matrix = lncSim;
% disease_sim_matrix = disSim_Jaccard;
% lncR_disease_matrix = interMatrix;
%% load dataset_2017 
load('datasets/Dataset_2017/disease_sim_2017.mat');
load('datasets/Dataset_2017/lncR_disease_2017.mat');
load('datasets/Dataset_2017/lncR_sim_2017.mat');


%% set the diagonal elements to 0
lncR_sim_matrix(logical(eye(size(lncR_sim_matrix)))) = 0;
disease_sim_matrix(logical(eye(size(disease_sim_matrix)))) = 0;

% construct a cell for convenience
A(1) = {lncR_sim_matrix};
D(1) = {disease_sim_matrix};


predRes = GetCaseStudy(A, D, lncR_disease_matrix);

%output

save('output/case_study.mat', 'predRes');
fprintf('Case study process completed.\n');
