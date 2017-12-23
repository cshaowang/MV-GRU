
% ==========================================================================
% ���������������ݼ�������ָ���ڲ�ͬά���µı仯�����
% ���ݼ�: t5, a5
% ����: 'POP', 'BPR', 'VBPR', 
%       'GRU', 'p-GRU', 'Con.', 'Fus.', '3mDAE-1U', '3mDAE-2U'
% ָ��:  recall@30, map@30, ndcg@30, auc
clear;
clc;

data_dataset = {
    'TaoBao', 'Amazon'};
data_method = {
    'POP', 'BPR', 'VBPR', ...
    'GRU', 'p-GRU', 'Con.', 'Fus.', '3mDAE-1U', '3mDAE-2U'};
data_evaluation = {
    'Recall@30', 'MAP@30', 'NDCG@30', 'AUC'};
data_dimensionality = [
    10, 15, 20, 25];

% taobao�ĸ�ָ����9�з�����ά��ֵ
t5_valid_weidu_recall_30 = {
    [0.8461, 0.8461, 0.8461, 0.8461]
    [0.7078, 0.6734, 0.6308, 0.6212]
    [0.6916, 0.6683, 0.6370, 0.6252]
    [0.8679, 0.8775, 1.0441, 1.0847]
    [0.8718, 0.8772, 0.8647, 0.8636]
    [1.0300, 1.1991, 1.3477, 1.4057]
    [1.0174, 1.1100, 1.2722, 1.3845]
    [0.9823, 1.2089, 1.2895, 1.3548]
    [0.8322, 0.9597, 1.1277, 1.1505]};
t5_valid_weidu_map_30 = {    
    [0.1908, 0.1908, 0.1908, 0.1908]
    [0.1485, 0.1360, 0.1315, 0.1232]
    [0.1418, 0.1359, 0.1274, 0.1259]
    [0.2081, 0.2118, 0.2664, 0.2780]
    [0.2162, 0.2140, 0.2087, 0.2004]
    [0.2424, 0.3035, 0.3599, 0.4019]
    [0.2259, 0.2617, 0.3287, 0.3852]
    [0.2086, 0.2849, 0.3130, 0.3554]
    [0.1745, 0.2063, 0.3263, 0.3409]};
t5_valid_weidu_ndcg_30 = { 
    [0.4377, 0.4377, 0.4377, 0.4377]
    [0.3542, 0.3314, 0.3136, 0.3013]
    [0.3417, 0.3285, 0.3129, 0.3082]
    [0.4513, 0.4555, 0.5790, 0.6044]
    [0.4588, 0.4498, 0.4546, 0.4472]
    [0.5344, 0.6595, 0.7619, 0.8234]
    [0.5268, 0.5920, 0.7090, 0.7981]
    [0.4941, 0.6427, 0.6960, 0.7606]
    [0.4115, 0.4908, 0.6638, 0.6856]};
t5_valid_weidu_auc = {
    [0.5209, 0.5209, 0.5209, 0.5209]
    [0.6024, 0.5975, 0.5926, 0.5864]
    [0.6414, 0.6319, 0.6244, 0.6114]
    [0.6287, 0.6273, 0.6266, 0.6277]
    [0.6259, 0.6223, 0.6233, 0.6207]
    [0.6909, 0.6924, 0.6958, 0.6980]
    [0.6825, 0.6874, 0.6928, 0.6990]
    [0.6812, 0.6856, 0.6886, 0.6856]
    [0.6816, 0.6886, 0.6831, 0.6870]};
t5_valid_weidu = {
    t5_valid_weidu_recall_30, t5_valid_weidu_map_30, ...
    t5_valid_weidu_ndcg_30, t5_valid_weidu_auc};

% data_method = {
%     'POP', 'BPR', 'VBPR', ...
%     'GRU', 'p-GRU', 'Con.', 'Fus.', '3mDAE-1U', '3mDAE-2U'};
% amazon�ĸ�ָ����9�ַ�����ά��ֵ
a5_valid_weidu_recall_30 = {
    [0.6462, 0.6462, 0.6462, 0.6462]
    [0.3004, 0.2874, 0.2629, 0.2687]
    [0.3365, 0.2972, 0.2901, 0.2772]
    [0.6453, 0.6123, 0.6315, 0.6350]
    [0.6466, 0.6475, 0.6154, 0.5994]
    [0.8293, 0.8227, 0.8302, 0.7973]
    [0.7772, 0.8178, 0.7981, 0.8249]
    [0.8088, 0.8311, 0.8534, 0.8472]
    [0.7932, 0.8383, 0.8271, 0.7875]};
a5_valid_weidu_map_30 = {    
    [0.1249, 0.1249, 0.1249, 0.1249]
    [0.0541, 0.0529, 0.0524, 0.0552]
    [0.0660, 0.0578, 0.0598, 0.0573]
    [0.1186, 0.1161, 0.1111, 0.1161]
    [0.1093, 0.1111, 0.1069, 0.1117]
    [0.1576, 0.1639, 0.1642, 0.1609]
    [0.1393, 0.1550, 0.1550, 0.1574]
    [0.1503, 0.1609, 0.1770, 0.1747]
    [0.1522, 0.1672, 0.1709, 0.1673]};
a5_valid_weidu_ndcg_30 = {
    [0.3248, 0.3248, 0.3248, 0.3248]
    [0.1413, 0.1385, 0.1320, 0.1360]
    [0.1666, 0.1468, 0.1461, 0.1391]
    [0.3111, 0.2976, 0.2943, 0.3055]
    [0.2970, 0.3049, 0.2909, 0.2859]
    [0.4013, 0.4088, 0.4128, 0.3980]
    [0.3692, 0.4002, 0.3915, 0.4012]
    [0.3892, 0.4101, 0.4339, 0.4214]
    [0.3889, 0.4154, 0.4112, 0.3999]};
a5_valid_weidu_auc = {
    [0.4002, 0.4002, 0.4002, 0.4002]
    [0.5027, 0.5028, 0.5016, 0.5033]
    [0.5952, 0.5881, 0.5819, 0.5772]
    [0.5736, 0.5729, 0.5735, 0.5724]
    [0.5722, 0.5717, 0.5712, 0.5693]
    [0.7290, 0.7278, 0.7269, 0.7274]
    [0.7274, 0.7289, 0.7276, 0.7278]
    [0.7225, 0.7263, 0.7269, 0.7266]
    [0.7225, 0.7262, 0.7264, 0.7270]};
a5_valid_weidu = {
    a5_valid_weidu_recall_30, a5_valid_weidu_map_30, ...
    a5_valid_weidu_ndcg_30, a5_valid_weidu_auc};

save data
clear t5_valid_weidu_recall_30 t5_valid_weidu_map_30 t5_valid_weidu_ndcg_30 t5_valid_weidu_auc
clear a5_valid_weidu_recall_30 a5_valid_weidu_map_30 a5_valid_weidu_ndcg_30 a5_valid_weidu_auc


% =========================================================================
% ���������������ݼ���ģ����recall@30��acu�ϵ����������ʡ�
% ���ݼ�: t5, a5
% ����: 'VBPR vs. BPR',  
%       'p-GRU vs. GRU', 'Con. vs. GRU', 'Fus. vs. GRU'
%       '3mDAE-1U vs. GRU', '3mDAE-2U vs. GRU'
% ָ��:  recall@30, auc
data_method_growth_rate = {
    'VBPR vs. BPR', 'p-GRU vs. GRU', ...
    'Con. vs. GRU', 'Fus. vs. GRU', '3mDAE-1U vs. GRU', '3mDAE-2U vs. GRU'};
data_evaluation_growth_rate = {
    'Recall@30 (%)', 'AUC (%)'};
data_interval_idxs = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
data_interval_labels = {
    '[1, 2]', '[1, 4]', '[1, 6]', '[1, 8]', '[1, 10]', '[1, 12]', ...
    '[1, 14]', '[1, 16]', '[1, 18]', 'all'};

% taobao����ָ����5����������������
t5_test_interval_recall_30 = {
    [0.0000, -0.1235, -0.1211, -0.1141, -0.0758, -0.0663, -0.0096, -0.0324, -0.0230, -0.0655]
    [-0.9258, -0.9059, -0.9090, -0.8934, -0.8892, -0.8683, -0.8645, -0.8556, -0.8620, -0.2051]
    [0.2346, 0.5665, 0.6912, 0.7566, 0.8224, 0.8629, 0.8848, 0.9278, 0.9645, 0.3757]
    [0.0305, 0.1759, 0.2684, 0.3112, 0.3485, 0.3925, 0.3957, 0.4060, 0.4508, 0.2999]
    [0.5799, 0.7338, 0.7972, 0.7967, 0.8505, 0.8280, 0.8266, 0.8460, 0.8893, 0.3790]
    [1.6541, 1.8669, 1.9919, 1.9711, 2.0921, 2.0309, 2.0434, 2.0531, 2.0628, 0.2660]};
t5_test_interval_auc = {
    [0.0655, 0.0644, 0.0638, 0.0654, 0.0676, 0.0679, 0.0677, 0.0665, 0.0668, 0.0503]
    [-0.0258, -0.0284, -0.0305, -0.0328, -0.0350, -0.0339, -0.0327, -0.0324, -0.0323, -0.0141]
    [0.2937, 0.3239, 0.3427, 0.3538, 0.3572, 0.3594, 0.3603, 0.3583, 0.3548, 0.2012]
    [0.3417, 0.3481, 0.3464, 0.3436, 0.3392, 0.3371, 0.3360, 0.3323, 0.3285, 0.1963]
    [0.3138, 0.3188, 0.3138, 0.3099, 0.3061, 0.3043, 0.3028, 0.2989, 0.2954, 0.1758]
    [0.2602, 0.2849, 0.3003, 0.3114, 0.3151, 0.3179, 0.3188, 0.3172, 0.3138, 0.1645]};
t5_test_interval = {
    t5_test_interval_recall_30, t5_test_interval_auc};

% amazon����ָ����5����������������
a5_test_interval_recall_30 = {
    [10.7143, 2.5789, 1.8810, 1.0671, 0.7907, 0.5502, 0.3852, 0.2807, 0.2504, -0.0014]
    [0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.5294, 0.7353, 0.5676, 0.0122]
    [100.00, 100.00, 100.00, 100.00, 100.00, 100.00, 95.5294, 56.2353, 59.4595, 0.3341]
    [100.00, 100.00, 100.00, 100.00, 100.00, 100.00, 91.5294, 56.1176, 58.1081, 0.2786]
    [100.00, 100.00, 100.00, 100.00, 100.00, 100.00, 100.2941, 59.0882, 61.5676, 0.3391]
    [100.00, 100.00, 100.00, 100.00, 100.00, 100.00, 96.5294, 58.3235, 60.6757, 0.3291]};
a5_test_interval_auc = {
    [0.1837, 0.1798, 0.1784, 0.1759, 0.1741, 0.1736, 0.1734, 0.1725, 0.1720, 0.1676]
    [0.0172, 0.0054, 0.0010, -0.0003, -0.0023, -0.0035, -0.0037, -0.0035, -0.0042, -0.0038]
    [0.5592, 0.4740, 0.4216, 0.3889, 0.3633, 0.3454, 0.3315, 0.3211, 0.3134, 0.2652]
    [0.4926, 0.4259, 0.3853, 0.3604, 0.3403, 0.3260, 0.3156, 0.3077, 0.3019, 0.2640]
    [0.4992, 0.4281, 0.3858, 0.3591, 0.3384, 0.3235, 0.3123, 0.3040, 0.2978, 0.2588]
    [0.5058, 0.4336, 0.3911, 0.3645, 0.3437, 0.3286, 0.3176, 0.3091, 0.3031, 0.2641]};
a5_test_interval = {
    a5_test_interval_recall_30, a5_test_interval_auc};

save data
clear t5_test_interval_recall_30 t5_test_interval_auc 
clear a5_test_interval_recall_30 a5_test_interval_auc
disp('Saving to: data.mat');

