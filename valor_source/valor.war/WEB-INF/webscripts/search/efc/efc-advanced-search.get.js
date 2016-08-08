model.domain = args.domain.toLowerCase();

model.articles = collectionService.getCollection(context.properties.section.id, args.collection);