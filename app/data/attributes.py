import pandas as pd
import os
import pathlib
diretorio = pathlib.Path('database')
caminho_arquivo_attributes = diretorio / 'attributes.json'
if caminho_arquivo_attributes.is_file():
    attributes = pd.read_json(caminho_arquivo_attributes)
else:
    attributes=False