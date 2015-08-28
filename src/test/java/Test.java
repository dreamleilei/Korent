import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 * Created by lei on 15-8-26.
 */
public class Test {
    public static void main(String[] args) {
        Configuration configuration = new Configuration().configure();
        ServiceRegistry sry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
        SessionFactory sessionFactory = configuration.buildSessionFactory(sry);

        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        transaction.commit();
        session.close();
        sessionFactory.close();


    }
}
