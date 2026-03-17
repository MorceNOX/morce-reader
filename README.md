# Morce Reader
Read aloud your EPUB files and print the text with big beautiful letters sentence by sentence. This is a terminal-based application designed to be simple and to give you the best reading experience ever!

## Requirements
You need to install the `Piper-TTS` engine available at `https://github.com/rhasspy/piper` and download your prefered voice models.
You can download the binary version of Piper-TTS compatible with your system, available on the above mencioned repository,

The voice files can be downloaded from `https://huggingface.co/rhasspy/piper-voices/tree/main`. Just choose your language and download the .onnx and .onnx.json files of the selected voices.

## Configuration
Once you have Piper-TTS available in the PATH and some voices downloaded, create the environment variable `PIPER_VOICES` pointing to the directory where your voice files are located:

```bash
export PIPER_VOICES=/home/your-username/piper-voices-directory
```
You can copy this statement to your `.bashrc` file or `.bashrc_profile` in your HOME directory.

## Run the executable file
Now you can read your e-books with:

```bash
$HOME/morce-reader/readme <your-epub-file>.epub
```

Enjoy your reading!

