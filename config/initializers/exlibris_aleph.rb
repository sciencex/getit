begin
  # Load all the sub libraries when the application starts
  Exlibris::Aleph::TablesManager.instance.sub_libraries.all
  # Load all the item circulation policies when the application starts
  Exlibris::Aleph::TablesManager.instance.item_circulation_policies.all
rescue Errno::ENOENT => e
  Rails.logger.warn("Skipping Exlibris::Aleph initialization since \"#{e.message}\"")
end