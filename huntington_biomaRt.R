# Load the biomaRt package
library(biomaRt)

# Set up the Ensembl Mart
ensembl <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")

# Define the MIM IDs for Huntington's disease
mim_ids <- c("123456", "123457", "123458", "123459", "123460")  # Replace with actual IDs

# Retrieve the first table: Entrez Gene ID, HGNC symbol, and Ensembl Gene ID
table1 <- getBM(
  attributes = c("entrezgene_id", "hgnc_symbol", "ensembl_gene_id"),
  filters = "mim_morbid_accession",
  values = mim_ids,
  mart = ensembl
)

# Retrieve the second table: HGNC symbol, Ensembl Gene ID, and Ensembl Transcript ID
table2 <- getBM(
  attributes = c("hgnc_symbol", "ensembl_gene_id", "ensembl_transcript_id"),
  filters = "mim_morbid_accession",
  values = mim_ids,
  mart = ensembl
)

# Display the tables
print("Table 1: Entrez Gene ID, HGNC symbol, Ensembl Gene ID")
print(table1)
print("Table 2: HGNC symbol, Ensembl Gene ID, Ensembl Transcript ID")
print(table2)

