# coding:utf-8

from flask import Flask, render_template, request
app = Flask(__name__)

import search

@app.route('/')
def hello_world():
    return 'Hello World!'

@app.route('/search/')
@app.route('/search/<query>')
def search_query(query=""):

	naive_search_results = search.naive_search(query)

	return render_template('search.tpl', 
							query=query,
							results=naive_search_results, 
							count=len(naive_search_results))

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000, debug=True)
