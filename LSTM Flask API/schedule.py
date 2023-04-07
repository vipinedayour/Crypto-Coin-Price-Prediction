# from tensorflow import keras
# from preprocessing import preprocess, nested_list_to_list_elements
# import pandas as pd
# from sklearn.preprocessing import MinMaxScaler
# from constants import *
#
#
# class Coin:
#     date_data = []
#     actualPrice = []
#     predictedPrice = []
#
#     def __init__(self, train_split, csv_path, model_path):
#         self.csv_path = csv_path
#         self.train_split = train_split
#         self.model_path = model_path
#
#     def updatePrice(self):
#         df = pd.read_csv(self.csv_path, parse_dates=['Date'])
#         model = keras.models.load_model(self.model_path)
#         # model = pk.load(open('models/BitcoinModel.sav', 'rb'))
#         scaler = MinMaxScaler()
#
#         close_price = df.Close.values.reshape(-1, 1)
#         scaled_close = scaler.fit_transform(close_price)
#
#         SEQ_LEN = 100
#
#         X_train, y_train, X_test, y_test = preprocess(scaled_close, SEQ_LEN, train_split=self.train_split)
#         y_hat = model.predict(X_test)
#         date = df['Date'][-len(X_test):].tolist()
#         date = [str(x)[:10] for x in date]
#         self.date_data = date
#
#         y_test_inverse = scaler.inverse_transform(y_test).tolist()
#         y_hat_inverse = scaler.inverse_transform(y_hat).tolist()
#
#         y_test_inverse = nested_list_to_list_elements(y_test_inverse)
#         y_hat_inverse = nested_list_to_list_elements(y_hat_inverse)
#
#         self.actualPrice = y_test_inverse
#         self.predictedPrice = y_hat_inverse
#
#
# Bitcoin = Coin(train_split=0.92, csv_path=bitcoin_dataset, model_path=bitcoin_model)
# Ethereum = Coin(train_split=0.85, csv_path=ethereum_dataset, model_path=ethereum_model)
# Dogecoin = Coin(train_split=0.85, csv_path=dogecoin_dataset, model_path=dogecoin_model)
# Tether = Coin(train_split=0.85, csv_path=usdt_dataset, model_path=usdt_model)
#
# print("update started")
# Bitcoin.updatePrice()
# Ethereum.updatePrice()
# Dogecoin.updatePrice()
# Tether.updatePrice()
# print("update ccompleted")