package models;

import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.QueryDocumentSnapshot;

import java.util.List;
import java.util.Map;

public class FirebaseBooks {
    public Long availability = 0L;
    public String title = "";
    public List<String> authors;
    public String publisher;
    public String publishedDate;
    public String description;
    public Long pageCount;
    public List<String> categories;
    public double averageRating;
    public List<String> industryIdentifier = null;
    public List<String> imageLinks;
    public String language;

    public void printFirebaseBooks()
    {
        System.out.println("Title : "+ title);
        System.out.println("Description : "+ description);
        System.out.println("Authors : "+ authors);
        System.out.println("Publisher : "+ publisher);
        System.out.println("Published Date : "+ publishedDate);
        System.out.println("Availability : "+ availability);
        System.out.println("Pages : "+ pageCount);
        System.out.println("ISBN : "+ industryIdentifier);
        System.out.println("ImageLinks : "+ imageLinks);
        System.out.println("AverageRating : "+ averageRating);
        System.out.println("Language : "+ language);
    }

    public static FirebaseBooks getBookFromFirebase(QueryDocumentSnapshot bookSnapshot) {
            FirebaseBooks firebaseBooks = new FirebaseBooks();
        try{
            System.out.println("here");
            final Map<String, Object> data = bookSnapshot.getData();
            firebaseBooks.availability = (Long) data.get("availability");
            firebaseBooks.title = (String) data.get("title");
            firebaseBooks.authors = (List<String>) data.get("authors");
            firebaseBooks.publisher = (String) data.get("publisher");
            firebaseBooks.publishedDate = (String) data.get("publishedDate");
            firebaseBooks.description = (String) data.get("description");
            firebaseBooks.pageCount = (Long) data.get("pageCount");
            firebaseBooks.categories = (List<String>) data.get("categories");
            firebaseBooks.averageRating = (double) data.get("averageRating");
            firebaseBooks.industryIdentifier =
                    (List<String>) data.get("industryIdentifier");
            // print('here');
            // try {
            //   print(firebaseBooks.industryIdentifier);
            // } catch (e) {
            //   print('err');
            // }
            firebaseBooks.imageLinks = (List<String>)data.get("imageLinks");
        firebaseBooks.language = (String) data.get("language");
        }
        catch (Exception e)
        {
            System.out.println("error" + e);
        }
        return firebaseBooks;
    }

    public static FirebaseBooks getBookFromFirebase(DocumentSnapshot bookSnapshot) {
        FirebaseBooks firebaseBooks = new FirebaseBooks();
        try{
            final Map<String, Object> data = bookSnapshot.getData();
            firebaseBooks.availability = (Long) data.get("availability");
            firebaseBooks.title = (String) data.get("title");
            firebaseBooks.authors = (List<String>) data.get("authors");
            firebaseBooks.publisher = (String) data.get("publisher");
            firebaseBooks.publishedDate = (String) data.get("publishedDate");
            firebaseBooks.description = (String) data.get("description");
            firebaseBooks.pageCount = (Long) data.get("pageCount");
            firebaseBooks.categories = (List<String>) data.get("categories");
            firebaseBooks.averageRating = (double) data.get("averageRating");
            firebaseBooks.industryIdentifier =
                    (List<String>) data.get("industryIdentifier");
            // print('here');
            // try {
            //   print(firebaseBooks.industryIdentifier);
            // } catch (e) {
            //   print('err');
            // }
            firebaseBooks.imageLinks = (List<String>)data.get("imageLinks");
            firebaseBooks.language = (String) data.get("language");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return firebaseBooks;
    }
}


/*
* To be implemented after adding support for Google books API in the app.
*/


//
//    static FirebaseBooks getFirebaseFromBook(Book book) {
//        FirebaseBooks firebaseBooks = FirebaseBooks();
//        firebaseBooks.title = book.info.title;
//        firebaseBooks.authors = book.info.authors;
//        firebaseBooks.publisher = book.info.publisher;
//        firebaseBooks.publishedDate = book.info.publishedDate.toString();
//        firebaseBooks.description = book.info.description;
//        firebaseBooks.pageCount = book.info.pageCount;
//        firebaseBooks.categories = book.info.categories;
//        firebaseBooks.averageRating = book.info.averageRating;
//        for (var isbn in book.info.industryIdentifier) {
//            firebaseBooks.industryIdentifier.add(isbn.toString());
//        }
//        firebaseBooks.imageLinks = [];
//        for (var uri in book.info.imageLinks.values) {
//            firebaseBooks.imageLinks.add(uri.toString());
//        }
//        firebaseBooks.language = book.info.language;
//        return firebaseBooks;
//    }
