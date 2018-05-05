import os

def application(env, start_response):
    start_response('200 OK', [('Content-Type', 'text/html')])
    if env['PATH_INFO'] == '/ip':
        return [open("./ip.html", "rb").read()]
    else:
        return [open("./index.html", "rb").read()]
 
