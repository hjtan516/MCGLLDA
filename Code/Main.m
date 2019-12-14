clc;              
clear;            % clear all workspace variables
close all;        % close all windows
  
currentFolder = pwd;              
addpath(genpath(currentFolder));

load('datasets/Dataset1/disSim_Jaccard.mat');
load('datasets/Dataset1/lncSim.mat');
load('datasets/Dataset1/interMatrix.mat');
lncR_sim_matrix = lncSim;
disease_sim_matrix = disSim_Jaccard;
lncR_disease_matrix = interMatrix;
% set the diagonal elements to 0
lncR_sim_matrix(logical(eye(size(lncR_sim_matrix)))) = 0;
disease_sim_matrix(logical(eye(size(disease_sim_matrix)))) = 0;

% construct a cell for convenience
A(1) = {lncR_sim_matrix};
D(1) = {disease_sim_matrix};


predRes = GetCaseStudy(A, D, lncR_disease_matrix);

%output
fprintf('Case study process completed.\n');
