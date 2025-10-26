import pandas as pd

# --- Step 1: Define file paths ---
# ✅ Use raw string (r"") to avoid unicode errors on Windows
input_file = r"netflix_data_cleaning\title.ratings.tsv\title.ratings.tsv"
output_file = r"netflix_data_cleaning\title.ratings.tsv\title.ratings.csv"

# --- Step 2: Read the TSV file ---
# IMDb TSV files are usually tab-delimited, with '\t'
df = pd.read_csv(input_file, sep='\t', low_memory=False)

# --- Step 3: Save as CSV ---
df.to_csv(output_file, index=False, encoding='utf-8')

print("✅ Conversion complete!")
print(f"CSV saved at: {output_file}")
