from flask import Flask, request, jsonify
from flask_cors import CORS
# from schedule import Bitcoin, Ethereum, Dogecoin, Tether


app = Flask(__name__)
CORS(app)


@app.route("/")
def hello():
    return jsonify(
        [
            {
                "HomeScreen": {
                    "column": [
                        {
                            "button": {
                                "text": "",
                                "color": "",
                                "font-size": "",
                                "font-weight": "",
                                "font-family": "",
                                "ChooseAction": "<new-screen/ open-link/ share-link>",
                                "width": "",
                                "height": "",
                                "padding": "",
                                "margin": "",
                                "background-color": "",
                                "background-image": "",
                                "icon": {
                                    "src": "",
                                    "size": "",
                                    "color": "",
                                    "position": "<left/ right/ center>"
                                },
                                "border": {
                                    "border-width": "",
                                    "border-color": "",
                                    "border-radius": ""
                                }
                            }
                        },
                        {
                            "divider": {
                                "type": "<none/ solid/ dashed/ dotted>",
                                "width": "",
                                "height": "",
                                "padding": "",
                                "margin": "",
                                "color": ""
                            }
                        }
                    ]
                }
            },
            {
                "CartScreen": {
                    "column": [
                        {
                            "html": {
                                "html": "<h1>this is heading 1</h2>",
                                "width": "",
                                "height": "",
                                "padding": "",
                                "margin": "",
                                "background-color": ""
                            }
                        },
                        {

                        }
                    ]
                }
            }
        ]
    )

#
# @app.route("/<coin>", methods=["GET"])
# def coin(coin):
#     if request.method == "GET":
#         if coin == "bitcoin":
#             return jsonify(
#                 actual_price=Bitcoin.actualPrice,
#                 predicted_price=Bitcoin.predictedPrice,
#                 date=Bitcoin.date_data
#             )
#         elif coin == "ethereum":
#             return jsonify(
#                 actual_price=Ethereum.actualPrice,
#                 predicted_price=Ethereum.predictedPrice,
#                 date=Ethereum.date_data
#             )
#         elif coin == "dogecoin":
#             return jsonify(
#                 actual_price=Dogecoin.actualPrice,
#                 predicted_price=Dogecoin.predictedPrice,
#                 date=Dogecoin.date_data
#             )
#         elif coin == "tether":
#             return jsonify(
#                 actual_price=Tether.actualPrice,
#                 predicted_price=Tether.predictedPrice,
#                 date=Tether.date_data
#             )
#         else:
#             return jsonify(
#                 actual_price=0,
#                 predicted_price=0,
#                 date=0
#             )


if __name__ == "__main__":
    app.run(debug=True)
