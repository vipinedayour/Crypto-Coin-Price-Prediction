# # -*- coding: utf-8 -*-
# """
# Created on Sun Dec  4 21:09:52 2022
#
# @author: User
# """
# import numpy as np
#
#
# def to_sequences(data, seq_len):
#     d = []
#
#     for index in range(len(data) - seq_len):
#         d.append(data[index: index + seq_len])
#
#     return np.array(d)
#
#
# def preprocess(data_raw, seq_len, train_split):
#     data = to_sequences(data_raw, seq_len)
#
#     num_train = int(train_split * data.shape[0])
#
#     X_train = data[:num_train, :-1, :]
#     y_train = data[:num_train, -1, :]
#
#     X_test = data[num_train:, :-1, :]
#     y_test = data[num_train:, -1, :]
#
#     return X_train, y_train, X_test, y_test
#
#
# def nested_list_to_list_elements(nested_list):
#     corr_list = []
#     for value in nested_list:
#         corr_list.append(value[0])
#     return corr_list
