package services;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.firebase.cloud.FirestoreClient;
import models.FirebaseBooks;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ExecutionException;

public class CRUDBooks {
    public ArrayList<FirebaseBooks> firebaseBooksList = new ArrayList<>();

    public static ArrayList<FirebaseBooks> getBooks() {
        Firestore db = FirestoreClient.getFirestore();
//        Map<String, String> map = new HashMap<String, String>(){{
//            put("a", "apple"); put("b", "bear"); put("c", "cat");}};
        ApiFuture<QuerySnapshot> querySnapshotApiFuture = db.collection("books").get();
        List<QueryDocumentSnapshot> documents = null;
        try {
            documents = querySnapshotApiFuture.get().getDocuments();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
        CRUDBooks crudBooks = new CRUDBooks();
        for (DocumentSnapshot document : documents) {
            FirebaseBooks ob = FirebaseBooks.getBookFromFirebase(document);
            crudBooks.firebaseBooksList.add(ob);
        }
        FirebaseBooks ob = FirebaseBooks.getBookFromFirebase(documents.get(0));
//        System.out.println(ob.title + "\n" + ob.description+ "\n" + ob.availability+ "\n"+ ob.averageRating+ "\n"+ ob.publisher+ "\n"+ ob.imageLinks+ "\n"+ob.industryIdentifier+"\n"+ob.authors+"\n"+ob.categories+"\n"+ob.language);
        System.out.println("done");
        return crudBooks.firebaseBooksList;
    }
}
