import time
import pandas as pd
import os
from sqlalchemy import create_engine

taxi_zone_file_path = "taxi_zone_lookup.csv"
trip_data_file_path = "green_tripdata_2019-10.csv"

# Postgresql connection 
engine = create_engine("postgresql://postgres:postgres@localhost:5432/ny_taxi")

taxi_data_frame = pd.read_csv(taxi_zone_file_path)
# load taxi data to the database
# Data is small so we load it once
taxi_data_frame.to_sql(name="taxidb", con=engine, if_exists="replace", index=False)

#  Load trip data to the database
# the data is large so we break it into chunks
i = 1
for chunk in pd.read_csv(trip_data_file_path, chunksize=10_000, low_memory=False):
    #  Convert lpep_pickup_datetime" and "lpep_dropoff_datetime column to timestamp
    chunk["lpep_pickup_datetime"] = pd.to_datetime(chunk["lpep_pickup_datetime"])
    chunk["lpep_dropoff_datetime"] = pd.to_datetime(chunk["lpep_dropoff_datetime"])
    
    # Add todatabase
    chunk.to_sql(name="tripdb", con=engine, if_exists="append", index=False)
    print(f"Loading{'..' * i}")
    i += 1
    time.sleep(2)
    os.system('cls' if os.name == 'nt' else 'clear')
