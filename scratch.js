db.incidents.find({source_id: 33}).forEach(
  function(doc) {
    doc.source_id = "5ac52592c73a56675f113f84";
    db.incidents.save(doc);
  }
)

db.incidents.find({source_id : {$exists: true}}).forEach(
  function (doc) {
    doc.source_id = new ObjectId(doc.source_id);
    db.incidents.save(doc);
  }
)

202 "_id": ObjectId("5ac52592c73a56675f11408d")
185 "_id": ObjectId("5ac52592c73a56675f11408e")
154 "_id": ObjectId("5ac52592c73a56675f113f91")
33 "_id": ObjectId("5ac52592c73a56675f113f84")

db.incidents.find({references: {$exists: false}}).forEach(
  function (doc) {
    doc.references = [{source: doc.source_id, page: doc.pages}];

    db.incidents.save(doc);
  }
)

db.incidents.find({pages: {$exists: true}}).forEach(
  function (doc) {
    delete doc.pages;
    db.incidents.save(doc);
  }
)


delete doc.source_id;
delete doc.pages;

db.incidents.find({_id: ObjectId("5ac8ee52f3342b964c96d3a7")}).forEach(
  function (doc) {
    doc.references = [{source: doc.source_id, page: doc.pages}];
    db.incidents.save(doc);
  }
)
