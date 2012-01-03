//$Id: AssertFalse.java 15133 2008-08-20 10:05:57Z hardy.ferentschik $
package org.hibernate.validator;

import java.lang.annotation.Documented;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import java.lang.annotation.Retention;
import static java.lang.annotation.RetentionPolicy.RUNTIME;
import java.lang.annotation.Target;

/**
 * The annotated property has to be false.
 *
 * @author Gavin King
 */
@Documented
@ValidatorClass(AssertFalseValidator.class)
@Target({METHOD, FIELD})
@Retention(RUNTIME)
public @interface AssertFalse {
	String message() default "{validator.assertFalse}";
}