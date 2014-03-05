# class CardCollectionManager
#   attr_accessor :collection

#   def initialize
#     # self.collection = CardCollection.new.cards
#     self.load
#   end

#   def addTodoWithTitle(title)
#     self.collection << CardCollection.new(title)
#   end

#   # def storageFile
#   #   NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0] + '/collection'
#   # end

#   def load
#     # self.collection  = NSKeyedUnarchiver.unarchiveObjectWithFile(self.storageFile) || []

#     data = NSUserDefaults.standardUserDefaults.objectForKey('collection')
#     self.collection = NSKeyedUnarchiver.unarchiveObjectWithData(data) || []
#   end

#   def save
#     # NSKeyedArchiver.archiveRootObject(self.collection, toFile:self.storageFile)

#     data = NSKeyedArchiver.archivedDataWithRootObject(self.collection)
#     NSUserDefaults.standardUserDefaults.setObject(data, forKey:'collection')
#     NSUserDefaults.standardUserDefaults.synchronize
#   end
# end
