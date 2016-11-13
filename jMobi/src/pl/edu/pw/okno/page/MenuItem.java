package pl.edu.pw.okno.page;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Created by michal on 17.10.2016.
 */

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface MenuItem {
    String itemName() default "[not defined]";
    int order() default 0;
}
