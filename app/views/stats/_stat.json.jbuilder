json.extract! stat, :id, :device_id, :disk_free, :disk_total, :memory_free, :memory_total, :update, :hostname, :kernel, :created_at, :updated_at
json.url stat_url(stat, format: :json)
