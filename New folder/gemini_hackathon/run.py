import subprocess
from ngrok_manager.tunnel import start_ngrok

def run_streamlit():
    subprocess.run(["streamlit", "run", "streamlit_app/main.py"])

if __name__ == "__main__":
    print("Starting Ngrok tunnel...")
    start_ngrok()
    print("Launching Streamlit app...")
    run_streamlit()
