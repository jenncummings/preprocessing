import bids
import os
import pandas as pd

bids_folder = '/working/mochila2/JC/data/bids'
bids_layout = bids.layout.BIDSLayout(bids_folder)
sub_list = bids_layout.get_subjects()
# print(sub_list)

dict = {'subject': sub_list} 
df = pd.DataFrame(dict) 
current_dir=os.getcwd() 
print(current_dir) 
# saving the dataframe 

csv_filename = os.path.join(current_dir,'all_subs.csv')
print('Saving CSV at '+csv_filename) 
df.to_csv(csv_filename,header=False,index=False)
