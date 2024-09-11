# repository  1 step 
```css
vpc/                     ---1
│
├── main.tf
├── vars.tf
└── README.md

```
```hcl
module "vpc" {
source = "git::https://github.com/wavedevops/vpc.git"
}
```

# repository inside repository - 2 steps

```css
terraform/                  ---1
│
├── vpc/                    ---2
│   ├── main.tf
│   └── variables.tf
└── README.md
```
```hcl
module "vpc" {
source = "git::https://github.com/wavedevops/terraform.git//vpc"
}
```

# repository, inside repository, inside repository - 3 steps

```css
terraform/                  ---1
│
├── module/                 ---2  
│   │ 
│   └── vpc/                 --3  
│       ├── main.tf       
│       └── variables.tf  
└── README.md
```
```hcl
module "vpc" {
  source = "git::https://github.com/wavedevops/terraform.git//module/vpc"
}

```

### how to get `.terraform` git source file 

```hcl
terraform get
```

```hcl
terraform get -update
```