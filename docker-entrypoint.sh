#!/bin/sh

set -eu

# download model if specified as argument and exit
if [ "$#" -eq 1 ]; then
    if [ "$1" = "llama-2-13b" ]; then
        MODEL_URL="https://huggingface.co/TheBloke/Llama-2-13B-chat-GGUF/resolve/main/llama-2-13b-chat.Q5_K_M.gguf"
        MODEL_SHA256="ef36e090240040f97325758c1ad8e23f3801466a8eece3a9eac2d22d942f548a"
    elif [ "$1" = "mistral-7b" ]; then
        MODEL_URL="https://huggingface.co/TheBloke/Mistral-7B-Instruct-v0.2-GGUF/resolve/main/mistral-7b-instruct-v0.2.Q5_K_M.gguf"
        MODEL_SHA256="b85cdd596ddd76f3194047b9108a73c74d77ba04bef49255a50fc0cfbda83d32"
    elif [ "$1" = "solar-10b" ]; then
        MODEL_URL="https://huggingface.co/TheBloke/SOLAR-10.7B-Instruct-v1.0-GGUF/resolve/main/solar-10.7b-instruct-v1.0.Q5_K_M.gguf"
        MODEL_SHA256="4ade240f5dcc253272158f3659a56f5b1da8405510707476d23a7df943aa35f7"
    elif [ "$1" = "starling-7b" ]; then
        MODEL_URL="https://huggingface.co/bartowski/Starling-LM-7B-beta-GGUF/resolve/main/Starling-LM-7B-beta-Q5_K_M.gguf"
        MODEL_SHA256="c67b033bff47e7b8574491c6c296c094e819488d146aca1c6326c10257450b99"
    elif [ "$1" = "command-r" ]; then
        MODEL_URL="https://huggingface.co/bartowski/c4ai-command-r-v01-GGUF/resolve/main/c4ai-command-r-v01-Q5_K_M.gguf"
        MODEL_SHA256="1a59aeb034b64e430d25bc9f2b29d9f2cc658af38670fae36226585603da8ecc"
    elif [ "$1" = "llama-3-8b" ]; then
        MODEL_URL="https://huggingface.co/bartowski/Meta-Llama-3-8B-Instruct-GGUF/resolve/main/Meta-Llama-3-8B-Instruct-Q5_K_M.gguf"
        MODEL_SHA256="16d824ee771e0e33b762bb3dc3232b972ac8dce4d2d449128fca5081962a1a9e"
    elif [ "$1" = "phi-3-mini" ]; then
        MODEL_URL="https://huggingface.co/bartowski/Phi-3-mini-4k-instruct-GGUF/resolve/main/Phi-3-mini-4k-instruct-Q6_K.gguf"
        MODEL_SHA256="597a483b0e56360cb488d3f8a5ec0fd2c3a3eb44da7bb69020b79ba7c1f6ce85"
    elif [ "$1" = "L3-8B-Stheno-v3.3-32K-Q5_K_M" ]; then
        MODEL_URL="https://huggingface.co/Lewdiculous/L3-8B-Stheno-v3.3-32K-GGUF-IQ-Imatrix/resolve/main/L3-8B-Stheno-v3.3-32K-Q5_K_M-imat.gguf"
        MODEL_SHA256="b68243a85fb6091b737858a276a11cf613838e70ef6ba38647536341e984bda4"
    elif [ "$1" = "nomic-embed-text-v1.5" ]; then
        MODEL_URL="https://huggingface.co/nomic-ai/nomic-embed-text-v1.5-GGUF/resolve/main/nomic-embed-text-v1.5.Q8_0.gguf"
        MODEL_SHA256="3e24342164b3d94991ba9692fdc0dd08e3fd7362e0aacc396a9a5c54a544c3b7"
    elif [ "$1" = "Gemma2-Gutenberg-Doppel-9B" ]; then
        MODEL_URL="https://huggingface.co/bartowski/Gemma2-Gutenberg-Doppel-9B-GGUF/resolve/main/Gemma2-Gutenberg-Doppel-9B-Q4_K_L.gguf"
        MODEL_SHA256="8a550abee0371c312e6c12bc5f57b4aa9573eb76d9cd184ef979f7dc0cd4af31"
    elif [ "$1" = "Llama-3.2-3B-Instruct" ]; then
        MODEL_URL="https://huggingface.co/bartowski/Llama-3.2-3B-Instruct-GGUF/resolve/main/Llama-3.2-3B-Instruct-Q8_0.gguf"
        MODEL_SHA256="b5607b5090a8280063fff2d706bb3408ca6542341b06aab39c3eca0a28575921"
    elif [ "$1" = "phi-4" ]; then
        MODEL_URL="https://huggingface.co/unsloth/phi-4-GGUF/resolve/main/phi-4-Q2_K_L.gguf"
        MODEL_SHA256="290ab4939168c8c94ff5eaddf8f328240ec8355eab8dd0641c6c31972a24752e"
    elif [ "$1" = "Dolphin3.0-Llama3.2-3B" ]; then
        MODEL_URL="https://huggingface.co/bartowski/Dolphin3.0-Llama3.2-3B-GGUF/resolve/main/Dolphin3.0-Llama3.2-3B-Q8_0.gguf"
        MODEL_SHA256="d7a51f65ebd35e7e7da5632274183c9b54f38330e015a6c73adca0bf3523fdae"
    elif [ "$1" = "DeepSeek-R1-Distill-Llama" ]; then
        MODEL_URL="https://huggingface.co/unsloth/DeepSeek-R1-Distill-Llama-8B-GGUF/resolve/main/DeepSeek-R1-Distill-Llama-8B-Q4_K_M.gguf"
        MODEL_SHA256="f8eba201522ab44b79bc54166126bfaf836111ff4cbf2d13c59c3b57da10573b"
    else
        echo "$0 [llama-2-13b|mistral-7b|solar-10b|starling-7b|command-r|llama-3-8b|phi-3-mini|phi-4|L3-8B-Stheno-v3.3-32K-Q5_K_M|nomic-embed-text-v1.5|Gemma2-Gutenberg-Doppel-9B|Llama-3.2-3B-Instruct|Dolphin3.0-Llama3.2-3B|DeepSeek-R1-Distill-Llama]"

        exit 1
    fi
    MODEL_NAME=$(basename "$MODEL_URL")
    curl -LO "$MODEL_URL"
    echo "$MODEL_SHA256  $MODEL_NAME" | sha256sum -c -
    exit 0
fi

# set default environment variables if not set
if [ -z ${LLAMA_HOST+x} ]; then
    export LLAMA_HOST="0.0.0.0"
fi
if [ -z ${LLAMA_MODEL+x} ]; then
    export LLAMA_MODEL="/models/llama-2-13b-chat.Q5_K_M.gguf"
fi

# convert LLAMA_ environment variables to llama-server arguments
LLAMA_ARGS=$(env | grep LLAMA_ | awk '{
    # for each environment variable
    for (n = 1; n <= NF; n++) {
        # replace LLAMA_ prefix with --
        sub("^LLAMA_", "--", $n)
        # find first = and split into argument name and value
        eq = index($n, "=")
        s1 = tolower(substr($n, 1, eq - 1))
        s2 = substr($n, eq + 1)
        # replace _ with - in argument name
        gsub("_", "-", s1)
        # print argument name and value
        print s1 " " s2
    }
}')

set -x
/app/llama-server $LLAMA_ARGS