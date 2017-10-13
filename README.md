# Domainbase (working title)
- central domain definition and data server, comparable with a ordinary database
  - contains both domain metadata and data
- setup according to the onion architecture: adapters communicate through sockets

# MVP
- excutables can be generated
- domainbase compiled with domainpase
- adding domain notions is always possible
- deleting domain notions only when unused

# Later/extra
- changing notions
- state is private
- no getters/setters
- no subclassing/extends --> only interfaces
