#Create Swap file memory to avoid using bigger instance
sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=2048
sudo /sbin/mkswap /var/swap.1
sudo /sbin/swapon /var/swap.1
sudo sh -c 'echo "/var/swap.1 swap swap defaults 0 0 " >> /etc/fstab'

# The Ubuntu repos contain an outdated version of R so lets add the updated repo to avoid errors
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'

# Update ubuntu package repo, to get latest R
sudo apt update

# Install R
sudo apt -y install r-base r-base-dev

# Install debian package manager, gdebi
sudo apt install gdebi-core

# Dependencies for R packages like RMariaDB, devtools, tidyverse, sparklyr. Please run seperate.
sudo apt -y install libcurl4-openssl-dev 

sudo apt -y install libssl-dev libxml2-dev libmariadbclient-dev build-essential libcurl4-gnutls-dev

# Install RStudio
wget https://download2.rstudio.org/server/xenial/amd64/rstudio-server-1.4.1103-amd64.deb
sudo gdebi rstudio-server-1.4.1103-amd64.deb
sudo rm rstudio-server-1.4.1103-amd64.deb

# Install tidyverse
# sudo R -e "install.packages('tidyverse')"

# Add user info to login RStudio
sudo adduser rstudio

#Add rstudio to sudo group
sudo usermod -aG sudo rstudio

# Install Java and reconfigure in R for RStudio use
sudo apt -y install default-jdk
sudo R CMD javareconf


# Change permissions for R library
sudo chmod 777 -R /usr/local/lib/R/site-library
