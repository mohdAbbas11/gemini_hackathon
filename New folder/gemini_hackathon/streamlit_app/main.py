import streamlit as st
from gemini_api import get_gemini_response

st.set_page_config(page_title="Q&A Demo")
st.header("Gemini LLM Application")

if "chat_history" not in st.session_state:
    st.session_state["chat_history"] = []

input_text = st.text_input("Input: ", key="input")
submit = st.button("Ask the question")

if submit and input_text:
    response = get_gemini_response(input_text)
    st.session_state["chat_history"].append(("You", input_text))
    st.subheader("The Response is")
    for chunk in response:
        st.write(chunk.text)
        st.session_state["chat_history"].append(("Bot", chunk.text))

st.subheader("The Chat History is")
for role, text in st.session_state["chat_history"]:
    st.write(f"{role}: {text}")
