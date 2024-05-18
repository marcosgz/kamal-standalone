Kamal::Cli::App.class_eval do
  desc "launch [CMD]", "Launch a standalone container for on-off tasks (use --help to show options)"
  option :interactive, aliases: "-i", type: :boolean, default: true, desc: "Execute command over ssh for an interactive shell (use for console/bash)"
  option :push, aliases: "-P", type: :boolean, default: false, desc: "Push the app image before launching"
  option :version, aliases: "-v", type: :string, desc: "Version of the app to use"
  def launch(cmd)
    # username = ENV["USER"] || ENV["USERNAME"] || `whoami`.strip
    puts "Launching command '#{cmd}' as #{username}..."
    # Kamal::Cli::Build.new.invoke(:push, [], build_options) if options[:push]

    pp build_options
    # case
    # when options[:interactive]
    #   say "Get most recent version available as an image...", :magenta unless options[:version]
    #   using_version(version_or_latest) do |version|
    #     say "Launching interactive command with version #{version} via SSH from new container on #{KAMAL.primary_host}...", :magenta
    #     run_locally do
    #       exec KAMAL.app(role: KAMAL.primary_role).execute_in_new_container_over_ssh(cmd, host: KAMAL.primary_host)
    #     end
    #   end
    # else
    #   say "Get most recent version available as an image...", :magenta unless options[:version]
    #   using_version(version_or_latest) do |version|
    #     say "Launching command with version #{version} from new container...", :magenta
    #     on(KAMAL.hosts) do |host|
    #       roles = KAMAL.roles_on(host)

    #       roles.each do |role|
    #         execute *KAMAL.auditor.record("Executed cmd '#{cmd}' on app version #{version}"), verbosity: :debug
    #         puts_by_host host, capture_with_info(*KAMAL.app(role: role).execute_in_new_container(cmd))
    #       end
    #     end
    #   end
    # end
  end

  protected

  def build_options
    keys = %i[verbose quiet version primary hosts roles config_file destination skip_hooks]
    options.slice(*keys)
  end
end
