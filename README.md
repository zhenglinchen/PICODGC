
> Phylogenetic Independent Contrasts for Outlier- and Distribution-Guided Correlation

---

## 🔍 Features

- `PIC_ODGC()`: Calculate trait correlations using PIC-ODGC method
- `Get_Recommend_K()`: Infer K-value based on sample size
- `Count_Max_MAD()`: Compute maximum absolute deviation of a vector


---

## ⚡ Quick Start

### Installation

```r
# Development version
remotes::install_github("zhenglinchen/PICODGC")

```
### Usage
```r
# Load example data
data("example_data")
data("example_tree")

# Calculate MAD for trait vectors
Count_Max_MAD(example_data$X1)
Count_Max_MAD(example_data$X2)
```

We can use PIC_ODGC only with traits data and phylogeny, and it will calculate the MAD_threshold inferred by sample size automatically.
```r
# Run analysis with auto-detected threshold
PIC_ODGC(example_data,"X1","X2",my_tree = example_tree)

# View the automatically calculated threshold
Get_Recommand_K(nrow(example_data))

```

To use a custom MAD threshold:

```r
PIC_ODGC(example_data,"X1","X2",
  my_tree = example_tree,
  MAD_threshold = 2, # User-defined threshold
  threshold.auto = FALSE # Disable auto-calculation
)
```


