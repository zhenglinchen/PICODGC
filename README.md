
> Phylogenetic Independent Contrasts for Outlier- and Distribution-Guided Correlation

---

## 🔍 Features

- `PIC_ODGC()`: Calculate trait correlations using PIC-ODGC method
- `CalculateIQR()`: This function calculates the distance of each data point from the nearest quartile boundary, expressed in units of the Interquartile Range (IQR). It returns a vector where each element indicates how many IQR units a data point deviates from either the first quartile (Q1) or third quartile (Q3), depending on its position relative to the interquartile range.


---

## ⚡ Quick Start

### Installation

```r
# Development version
remotes::install_github("zhenglinchen/PICODGC")
library(PICODGC)

```
### Usage
```r
# Load example data
data("example_data")
data("example_tree")

# Calculate the distance of each data point from the nearest quartile boundary for trait vectors
CalculateIQR(example_data$X1)
CalculateIQR(example_data$X2)
```

We can use PIC_ODGC only with traits data and phylogeny, and it will use 1.5xIQR as default.
```r
# Run analysis with auto-detected threshold
PIC_ODGC(example_data,"X1","X2",my_tree = example_tree)


```

To use a custom MAD threshold:

```r
PIC_ODGC(example_data,"X1","X2",
  my_tree = example_tree,
  IQR_threshold = 2
)
```


