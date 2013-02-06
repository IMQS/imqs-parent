require "fileutils"

out_dir = "../../out"

def exec_or_die( cmd )
	res = `#{cmd}`
	if $?.exitstatus != 0
		print(res)
		exit(false)
	end
end

case ARGV[0]
  when "prepare"	then
    exec_or_die( "mvn -DskipTests install" )
  when "test" then
    exec_or_die("mvn clean test")
end
