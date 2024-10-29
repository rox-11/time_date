#!/bin/bash


#   _____    __    __   ______    __     __
#  /   . \  /  \  /  \ /      \  /  \   /  \   configured by (@snom)
#  |  ___/`~|   \ |  | |  []  |  |   \ /   |
#  | |____  |  \ \|  | |  ||  |  |         |
#  |____  | |  |\    | |  ||  |  |  |\_/|  |
#   ____| | |  | \   | |  []  |  |  |   |  |
#  |______| \__/  \__/ \______/  \__/   \__/
  



echo "
    ================================
                                    
        auto = '-a'  manual = '-m' '

        ntp = '-n'   showing t&d = '-s'      
                                   
    ================================

"
# thats input for take the value 

read -p "     select auto or manu     " select
echo "    "



# conditions that able the user to select difrent option
if [ $select = "-a" ] ;then #auto t&d set
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~auto~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    # date command
    sudo date -s "$(wget --method=HEAD -qSO- --max-redirect=0 google.com 2>&1 | sed -n 's/^ *Date: * //p   ')"
    # time command
    sudo date -s "$(wget --method=HEAD -qSO- --max-redirect=0 google.com 2>&1 | sed -n 's/^ *Time: * //p   ')"



# showing the t&d
elif [ $select = "-s" ] ;then
echo          "=============================date&time======================================"
                        timedatectl
echo          "============================================================================"


# time manual setting 
elif [ $select = "-m" ] ;then
echo "     select what do you want to change

1)time

2)date

3)both
    "

read -p "write the option     " x

case $x in  #this case for the settings types 
    1)
      echo "_____________________________time______________________________________"

      read -p "write hour    " hour
      read -p "write minut    " minut
      read -p "write second    " second
      timedatectl set-time $hour:$minut:$second
      ;; 
    2)
      echo "_____________________________time______________________________________"

      read -p "write year    " year
      read -p "write month    " month
      read -p "write day    " day
      timedatectl set-time $year-$month-$day
      ;; 
    3)
      echo "_____________________________time&date__________________________________"

      echo "======date======"
      read -p "write year    " year1
      read -p "write month    " month2
      read -p "write day    " day3
      echo "======time======"
      read -p "write hour    " hour1
      read -p "write minut    " minut2
      read -p "write second    " second3
      timedatectl set-time  $year1-$month2-$day3$hour1:$minut2:$second3
      ;; 
esac

#network time protocol
elif [ $select = "-n" ] ;then
echo "_____________________________ntp__________________________________"


read -p "ntp on[1] no[2]  " ntp 
case $ntp in  #this case for ntp enable or else 
        1)
          sudo timedatectl set-ntp on
          echo "NTP service : enable"
          ;; 
        2)
          sudo timedatectl set-ntp no 

          echo "NTP service : desable"
          ;; 
      esac
fi
