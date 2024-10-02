from pyngrok import ngrok

def start_ngrok():
    public_tunnel = ngrok.connect(name="gemini app")
