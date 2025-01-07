@isTest
public class  AAAAConflictTest {
    public static testmethod void testCountPlusOne(){
        Decimal input = 10;
        decimal result =  AAAConflict.countPlusOne(input);
        System.assertEquals(11, result);
    }
}