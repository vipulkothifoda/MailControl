# mailcontrol

Please follow the below steps

1. Place the cookbook in the ubuntu 14.04 machine.
2. Go to the path MailControl/recipes.
3. Run the mailcontrol.rb recipe by using the below command:
     sudo chef-client --local-mode mailcontrol.rb
4. You can also run the cookbook by using the run list with the below command:
      sudo chef-client -z -r "recipe[MailControl"
