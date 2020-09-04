# frozen_string_literal: true

if defined?(PryByebug)
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 'e', 'exit'
end

require 'awesome_print'
AwesomePrint.pry!
# もし挙動がおかしければ上記消せばOK
# https://github.com/awesome-print/awesome_print
