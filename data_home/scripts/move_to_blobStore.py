from azureml.core import Workspace, Datastore, Dataset
from azureml.data.datapath import DataPath

ws = Workspace.from_config()
datastore = Datastore.get(ws, 'workspaceblobstore')
ds = Dataset.File.upload_directory(src_dir='models',
           target=DataPath(datastore,  'all_models'),
           show_progress=True)