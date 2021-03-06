# ðStudy

### 1. Stream
ê³¼ì  : ìì±íê¸° - ê°ê³µíê¸° - ê²°ê³¼ ë§ë¤ê¸°

##### (1) ë°°ì´ ì¤í¸ë¦¼ 
- Arrays.stream ë©ìëë¥¼ ì¬ì©
```java
String[] arr = new String[]{"a", "b", "c"};
Stream<String> stream = Arrays.stream(arr);
Stream<String> streamOfArrayPart = 
  Arrays.stream(arr, 1, 3); // 1~2 ìì [b, c]
```

##### (2) ì»¬ë ì ì¤í¸ë¦¼
- ì»¬ë ì íì(Collection, List, Set)ì ê²½ì° ì¸í°íì´ì¤ì ì¶ê°ë ëí´í¸ ë©ìë stream ì ì´ì©í´ì ì¤í¸ë¦¼ì ë§ë¤ ì ìë¤. 
```java
public interface Collection<E> extends Iterable<E> {
  default Stream<E> stream() {
    return StreamSupport.stream(spliterator(), false);
  } 
}
```
- Ex) 
```java 
List<String> list = Arrays.asList("a", "b", "c");
Stream<String> stream = list.stream();
Stream<String> parallelStream = list.parallelStream(); // ë³ë ¬ ì²ë¦¬ ì¤í¸ë¦¼

```


##### (3) Stream.builder()
- ë¹ëë¥¼ ì´ì©í´ ì§ì ì ì¼ë¡ ì¤í¸ë¦¼ ìì ìíë ê° ë£ì ì ìë¤. 
```java
Stream<String> builderStream = 
  Stream.<String>builder()
    .add("Eric").add("Elena").add("Java")
    .build(); // [Eric, Elena, Java]
```

##### (4) Stream.iterate()
- iterate ë©ìë ì´ì© ìì 
```java
Stream<Integer> iteratedStream = 
  Stream.iterate(30, n -> n + 2).limit(5); // [30, 32, 34, 36, 38]

```

##### (5) ë¬¸ìì´ ì¤í¸ë§
```java
Stream<String> stringStream = 
  Pattern.compile(", ").splitAsStream("Eric, Elena, Java");
  // [Eric, Elena, Java]
```

##### (6) íì¼ ì¤í¸ë§ 
- Files í´ëì¤ì lines ë©ìëë í´ë¹ íì¼ì ê° ë¼ì¸ì ì¤í¸ë§ íìì ì¤í¸ë¦¼ì¼ë¡ ë§ë¤ì´ì¤ë¤. 
```java
Stream<String> lineStream = 
  Files.lines(Paths.get("file.txt"), 
              Charset.forName("UTF-8"));

```


##### (7) ì¤í¸ë¦¼ ì°ê²°íê¸°
- Stream.concat ë©ìëë¥¼ ì´ì©í´ ë ê°ì ì¤í¸ë¦¼ì ì°ê²°í´ì ìë¡ì´ ì¤í¸ë¦¼ì ë§ë¤ì´ë¼ ì ìë¤.

```java
Stream<String> stream1 = Stream.of("Java", "Scala", "Groovy");
Stream<String> stream2 = Stream.of("Python", "Go", "Swift");
Stream<String> concat = Stream.concat(stream1, stream2);
```
<br>
<br>
<hr>

### â 2. Map
- ê±°ì HashMapì ì¬ì©


##### (1) HashMap ê°ë 
- Mapì í¤ì ê°ì¼ë¡ êµ¬ì±ë Entryê°ì²´ë¥¼ ì ì¥íë êµ¬ì¡°ë¥¼ ê°ì§ê³  ìë ìë£êµ¬ì¡°ë¤. 
- í¤ì ê°ì ëª¨ë ê°ì²´ 
- ê°ì ì¤ë³µ ì ì¥ë  ì ìì§ë§ í¤ë ì¤ë³µ ì ì¥ë  ì ìì 
- ë§ì½ ê¸°ì¡´ì ì ì¥ë í¤ì ëì¼í í¤ë¡ ê°ì ì ì¥íë©´ ê¸°ì¡´ì ê°ì ìì´ì§ê³  ìë¡ì´ ê°ì¼ë¡ ëì¹ë¨
- HashMapì ë´ë¶ì 'í¤'ì 'ê°'ì ì ì¥íë ìë£ êµ¬ì¡°ë¥¼ ê°ì§ê³  ìë¤. HashMapì í´ì í¨ìë¥¼ íµí´ 'í¤'ì 'ê°'ì´ ì ì¥ëë ìì¹ë¥¼ ê²°ì íë¯ë¡, ì¬ì©ìë ê·¸ ìì¹ë¥¼ ì ì ìê³ , ì½ìëë ììì ë¤ì´ ìë ìì¹ ëí ê´ê³ê° ìì 

##### (2) HashMap ì ì¸ 
```java
HashMap<String,String> map1 = new HashMap<String,String>();//HashMapìì±
HashMap<String,String> map2 = new HashMap<>();//newìì íì íë¼ë¯¸í° ìëµê°ë¥
HashMap<String,String> map3 = new HashMap<>(map1);//map1ì ëª¨ë  ê°ì ê°ì§ HashMapìì±
HashMap<String,String> map4 = new HashMap<>(10);//ì´ê¸° ì©ë(capacity)ì§ì 
HashMap<String,String> map5 = new HashMap<>(10, 0.7f);//ì´ê¸° capacity,load factorì§ì 
HashMap<String,String> map6 = new HashMap<String,String>(){{//ì´ê¸°ê° ì§ì 
    put("a","b");
}};
```

##### (2) HashMap ê° ì¶ê°
```java
HashMap<Integer,String> map = new HashMap<>();//newìì íì íë¼ë¯¸í° ìëµê°ë¥
map.put(1,"ì¬ê³¼"); //ê° ì¶ê°
map.put(2,"ë°ëë");
map.put(3,"í¬ë");
```


##### (3) HashMap ê° ì­ì 
```java
HashMap<Integer,String> map = new HashMap<Integer,String>(){{//ì´ê¸°ê° ì§ì 
    put(1,"ì¬ê³¼");
    put(2,"ë°ëë");
    put(3,"í¬ë");
}};
map.remove(1); //keyê° 1 ì ê±°
map.clear(); //ëª¨ë  ê° ì ê±°
```

##### (4) HashMap ê° ì¶ë ¥ 
```java
HashMap<Integer,String> map = new HashMap<Integer,String>(){{//ì´ê¸°ê° ì§ì 
    put(1,"ì¬ê³¼");
    put(2,"ë°ëë");
    put(3,"í¬ë");
}};
System.out.println(map); //ì ì²´ ì¶ë ¥ : {1=ì¬ê³¼, 2=ë°ëë, 3=í¬ë}
System.out.println(map.get(1));//keyê° 1ì valueì»ê¸° : ì¬ê³¼
		
```
- entrySet() íì©
```java
//entrySet() íì©
for (Entry<Integer, String> entry : map.entrySet()) {
    System.out.println("[Key]:" + entry.getKey() + " [Value]:" + entry.getValue());
}
//[Key]:1 [Value]:ì¬ê³¼
//[Key]:2 [Value]:ë°ëë
//[Key]:3 [Value]:í¬ë
```

- keySet() íì©
```java
//KeySet() íì©
for(Integer i : map.keySet()){ //ì ì¥ë keyê° íì¸
    System.out.println("[Key]:" + i + " [Value]:" + map.get(i));
}
//[Key]:1 [Value]:ì¬ê³¼
//[Key]:2 [Value]:ë°ëë
//[Key]:3 [Value]:í¬ë
```




##### (5) Iterator ì¬ì©
```java
HashMap<Integer,String> map = new HashMap<Integer,String>(){{//ì´ê¸°ê° ì§ì 
    put(1,"ì¬ê³¼");
    put(2,"ë°ëë");
    put(3,"í¬ë");
}};
```
- entrySet.iterator
```java
//entrySet().iterator()
Iterator<Entry<Integer, String>> entries = map.entrySet().iterator();
while(entries.hasNext()){
    Map.Entry<Integer, String> entry = entries.next();
    System.out.println("[Key]:" + entry.getKey() + " [Value]:" +  entry.getValue());
}
//[Key]:1 [Value]:ì¬ê³¼
//[Key]:2 [Value]:ë°ëë
//[Key]:3 [Value]:í¬ë
```
- keySet.iterator
```java
//keySet().iterator()
Iterator<Integer> keys = map.keySet().iterator();
while(keys.hasNext()){
    int key = keys.next();
    System.out.println("[Key]:" + key + " [Value]:" +  map.get(key));
}
//[Key]:1 [Value]:ì¬ê³¼
//[Key]:2 [Value]:ë°ëë
//[Key]:3 [Value]:í¬ë
```

<br>
<hr>
<br>

### â 3. Generic
- ê°ì : ì°ë¦¬ê° íí ì°ë ArrayListë ì´ë»ê² ì¸ê¹?
- ë³´íµ ìëì ê°ì´ ì´ë¤. 
```java
ArrayList<Integer> list1 = new ArrayList<Integer>();
ArrayList<String> list2 = new ArrayList<Integer>();
```
- ì´ë ê² íìì ë¯¸ë¦¬ ì§ì í´ì£¼ë©´ ì ì°ì±ì´ ë¨ì´ì§ë¤. 

##### (1) ì ë¤ë¦­ì´ë?
- ì ë¤ë¦­ì ìì ArrayListìë ë¤ë¥´ê² í´ëì¤ ë´ë¶ìì ì§ì íë ê² ìë ì¸ë¶ìì ì¬ì©ìì ìí´ ì§ì ëë ê²ì ìë¯¸íë¤. ì¦, íìì ë¯¸ë¦¬ ì§ì í´ì£¼ë ê²ì´ ìë íìì ìí´ ì§ì í  ì ìëë¡ íë ì¼ë°(Generic) íìì´ë¼ë ê²ì´ë¤. 
- ì¥ì  
  -  í´ëì¤ ì¸ë¶ìì íìì ì§ì í´ì£¼ê¸° ëë¬¸ì ë°ë¡ íìì ì²´í¬íê³  ë³íí´ì¤ íìê° ìë¤. ì¦, ê´ë¦¬íê¸°ê° í¸íë¤.
  -  ë¹ì·í ê¸°ë¥ì ì§ìíë ê²½ì° ì½ëì ì¬ì¬ì©ì±ì´ ëìì§ë¤.

##### (2) í´ëì¤ ë° ì¸í°íì´ì¤ ì ì¸ 
- ê¸°ë³¸
```java
public class ClassName <T> { ... }
public Interface InterfaceName <T> { ... }
```
- íì ë ê° ì ì¸
```java
public class ClassName <T, K> { ... }
public Interface InterfaceName <T, K> { ... }
```
- ì ì¸ë ì ë¤ë¦­ì íìì£¼ê¸°(int, double ë± primitive Typeì ì¬ ì ìê³  Wrapper Typeì¼ë¡ ì¤ ì ìë¤.)
```java
public class ClassName <T, K> { ... }
 
public class Main {
	public static void main(String[] args) {
		ClassName<String, Integer> a = new ClassName<String, Integer>();
	}
}
```

##### (3) ì ë¤ë¦­ í´ëì¤ ì¬ì©íê¸° 
- ê¸°ë³¸
```java
// ì ë¤ë¦­ í´ëì¤
class ClassName<E> {
	
	private E element;	// ì ë¤ë¦­ íì ë³ì
	
	void set(E element) {	// ì ë¤ë¦­ íë¼ë¯¸í° ë©ìë
		this.element = element;
	}
	
	E get() {	// ì ë¤ë¦­ íì ë°í ë©ìë
		return element;
	}
	
}
 
class Main {
	public static void main(String[] args) {
		
		ClassName<String> a = new ClassName<String>();
		ClassName<Integer> b = new ClassName<Integer>();
		
		a.set("10");
		b.set(10);
	
		System.out.println("a data : " + a.get());
		// ë°íë ë³ìì íì ì¶ë ¥ 
		System.out.println("a E Type : " + a.get().getClass().getName());
		
		System.out.println();
		System.out.println("b data : " + b.get());
		// ë°íë ë³ìì íì ì¶ë ¥ 
		System.out.println("b E Type : " + b.get().getClass().getName());
		
	}
  // a data : 10
  // a E Type : java.lang.String

  // b.data : 10
  // b E Type : java.lang.Integer

}
```
- ë ê° ì¬ì©
```java
// ì ë¤ë¦­ í´ëì¤ 
class ClassName<K, V> {	
	private K first;	// K íì(ì ë¤ë¦­)
	private V second;	// V íì(ì ë¤ë¦­) 
	
	void set(K first, V second) {
		this.first = first;
		this.second = second;
	}
	
	K getFirst() {
		return first;
	}
	
	V getSecond() {
		return second;
	}
}
 
// ë©ì¸ í´ëì¤ 
class Main {
	public static void main(String[] args) {
		
		ClassName<String, Integer> a = new ClassName<String, Integer>();
		
		a.set("10", 10);
 
 
		System.out.println("  fisrt data : " + a.getFirst());
		// ë°íë ë³ìì íì ì¶ë ¥ 
		System.out.println("  K Type : " + a.getFirst().getClass().getName());
		
		System.out.println("  second data : " + a.getSecond());
		// ë°íë ë³ìì íì ì¶ë ¥ 
		System.out.println("  V Type : " + a.getSecond().getClass().getName());
	}

  // first data : 10
  // K Type : java.lang.String

  // second data : 10
  // V Type : java.lang.Integer
}


```
<br>
<br>
<hr>

### â 3. KeyCodeë¡ í¹ì  í¤ ë§ê¸°


- í¤ì½ë í 
<img src="/img/keycode.PNG" width="100%"></img>
```java
	// . + -  í¤ì½ëë¡ ë§ê¸°
		window.addEventListener("keydown", function (event) {
		if (event.defaultPrevented) {
			return;
		}

		var handled = false;

  		// numlock - ìë ¥ ì í
		if (event.keyCode ==109)
    		handled = true;

		// numlock + ìë ¥ ì í
		else if (event.keyCode == 107)
			handled = true;

		// numlock . ìë ¥ ì í
		else if(event.keyCode == 110)
			handled = true;

		// + ìë ¥ ì í
		else if(event.keyCode == 189)
			handled = true;

		// - ìë ¥ ì í
		else if(event.keyCode == 187)
			handled = true;

		// . ìë ¥ì í
		else if(event.keyCode == 190)
			handled = true;

		if (handled) {
			console.log(event.keyCode);
			event.preventDefault();
		}
	}, true);


```

<br>
<br>
<hr>

## â 4. ì ê·ì ê³µë¶íê¸°
- ì´ë©ì¼ ì ê·ì(javaìì jsë ë¤ë¥´ê² ì¨ì¼ë¨)
```java
 /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
```
- ì íë²í¸ ì ê·ì íì´í ìëì¼ë¡ ë£ì´ì£¼ê¸°
```java
//input ìì class phoneNumber ë£ê¸° 
$(document)
.on(
	"keyup",
	".phoneNumber",
	function() {
		$(this).val($(this)
			   .val()
			   .replace(/[^0-9]/g, "")
			   .replace(
					/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,
					"$1-$2-$3").replace(
					"--", "-"));
	}
);


```

<br>
<br>
<hr>

## â 5. Threadë?

- íë¡ì¸ì¤ : ì´ìì²´ì ë¡ë¶í° ììì í ë¹ ë°ë ììì ë¨ì
- ì¤ë ë : íë¡ì¸ì¤ê° í ë¹ë°ì ììì ì´ì©íë ì¤íì ë¨ì, íë¡ì¸ì¤ ë´ìì ì¤ì ë¡ ììì ìííë ì£¼ì²´
  - ê°ê°ì ì¤ë ëë ëë¦½ì ì¸ ììì ìíí´ì¼ íê¸° ëë¬¸ì ê°ìì ì¤íê³¼ ë ì§ì¤í° ê°ì ê°ì§
  - ì»¤ëì ëììì´ ìí¸ê° íµì  ê°ë¥ 
  - ëë¦½ì ì¸ ì¤í 
    - ëë¦½ì ì¸ í¨ì í¸ì¶ ê°ë¥
    - ëë¦½ì ì¸ ì¤í íë¦ ê°ë¥ 

<br>

### 1. ì¤ë ëì ìì±ê³¼ ì¤í 
(1) Thread í´ëì¤ ììë°ë ë°©ë² 
(2) Runnable ì¸í°íì´ì¤ êµ¬ííë ë°©ë² 
- Thread í´ëì¤ë¥¼ ììë°ì¼ë©´ ë¤ë¥¸ í´ëì¤ë¥¼ ììë°ì ì ìì¼ë¯ë¡, ì¼ë°ì ì¼ë¡ Runnable ì¸í°íì´ì¤ë¥¼ êµ¬ííë ë°©ë²ì¼ë¡ ì¤ë ëë¥¼ ìì±í©ëë¤.
- Runnable ì¸í°íì´ì¤ë ëª¸ì²´ê° ìë ë©ìëì¸ run() ë©ìë ë¨ íëë§ì ê°ì§ë ê°ë¨í ì¸í°íì´ì¤ìëë¤.



```java
class ThreadWithClass extends Thread {
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println(getName()); // íì¬ ì¤í ì¤ì¸ ì¤ë ëì ì´ë¦ì ë°íí¨.
            try {
                Thread.sleep(10);          // 0.01ì´ê° ì¤ë ëë¥¼ ë©ì¶¤.
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
 

class ThreadWithRunnable implements Runnable {
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println(Thread.currentThread().getName()); // íì¬ ì¤í ì¤ì¸ ì¤ë ëì ì´ë¦ì ë°íí¨.
            try {
                Thread.sleep(10);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

 

public class Thread01 {
    public static void main(String[] args){
        ThreadWithClass thread1 = new ThreadWithClass();       // Thread í´ëì¤ë¥¼ ììë°ë ë°©ë²
        Thread thread2 = new Thread(new ThreadWithRunnable()); // Runnable ì¸í°íì´ì¤ë¥¼ êµ¬ííë ë°©ë²


        thread1.start(); // ì¤ë ëì ì¤í
        thread2.start(); // ì¤ë ëì ì¤í
    }
}

<!-- 
Thread-0
Thread-1
Thread-0
Thread-1
Thread-0
Thread-1
Thread-0
Thread-1
Thread-0
Thread-1 
-->
```
<br>
<br>

### 2. ì¤ë ë ì°ì ìì 
```java
thread.setPriority(ì°ì ìì);
```
- ì°ì ììê° ëì ì¤ë ëê° ì¤íìíë¥¼ ë ë§ì´ ê°ì ¸ê° 
- ê°ì²´ì ì°ì ììë¥¼ ë¶ì¬íì¬ ê°ë°ìê° ì ì´ê°ë¥ 
- 1 ~ 10ê¹ì§ ì°ì ìì, ëì¼ë©´ ë¨¼ì  ì¤í 
```java
// ì°ì ìì ìì 
Thread.MAX_PRIORITY(10), Thread.NORM_PRIORITY(5), Thread.MIN_PRIORITY(1)
```
- ì°ì ììê° ëì ì¤ë ëê° ì¤íê¸°íë¥¼ ë ë§ì´ ê°ì§ê¸° ëë¬¸ì ì°ì ììê° ë ë®ì ì¤ë ëë³´ë¤ ê°ì ììì´ë¼ë ë¹¨ë¦¬ ëë¼ ì ìë¤.
- íì§ë§ ì¿¼ë ì½ì´ì¼ ê²½ì° ì¤ë ëê° 4ê° ë³´ë¤ ì ì ê²½ì°ë ì°ì ììê° í¬ê² ìí¥ì ë¯¸ì¹ì§ ëª»íë¤. 5ê°ì´ìì¼ë ì°ì ìì ë°©ìì´ í¨ê³¼ë¥¼ ë³´ê² ëë¤.

```java
class ThreadWithRunnable implements Runnable {
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println(Thread.currentThread().getName()); // íì¬ ì¤í ì¤ì¸ ì¤ë ëì ì´ë¦ì ë°íí¨.
            try {
                Thread.sleep(10);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}


public class Thread02 {
    public static void main(String[] args){
        Thread thread1 = new Thread(new ThreadWithRunnable());
        Thread thread2 = new Thread(new ThreadWithRunnable());
 
â       thread2.setPriority(10); // Thread-1ì ì°ì ììë¥¼ 10ì¼ë¡ ë³ê²½í¨.
â¡      thread1.start(); // Thread-0 ì¤í
â¢      thread2.start(); // Thread-1 ì¤í

        System.out.println(thread1.getPriority());
        System.out.println(thread2.getPriority());
    }
}

// 5
// 10
// Thread-1
// Thread-0
// Thread-1
// Thread-0
// Thread-1
// Thread-0
// Thread-1
// Thread-0
// Thread-1
// Thread-0

```
<br>
<br>

### 2. ë©í° ì¤ë ë 
1. ì¥ì 
- íëì íë¡ì¸ì¤ ë´ìì ë ì´ìì ì¤ë ëê° ëìì ììì ìííë ê²ì ìë¯¸íë¤. 
- ë©í°ì¤ë ëë ê° ì¤ë ëê° ìì ì´ ìí íë¡ì¸ì¤ì ë©ëª¨ë¦¬ë¥¼ ê³µì í´ì ìì¤í ë­ë¹ê° ì ë¤. 
- íëì ì¤ë ëê° ììí  ë ë¤ë¥¸ ì¤ë ëê° ë³ëì ììì í  ì ìì´ ì¬ì©ììì ìëµì±ë ì¢ìì§ 

2. ë¨ì (ë¬¸ë§¥êµí)
- cpu ì½ì´ ìë³´ë¤ ë§ì ì¤ë ëê° ì¤íëë©´ ê° ì½ì´ê° ì í´ì§ ìê° ëì ì¬ë¬ ììì ë²ê°ì ìííëë° ì´ë ì¤ë ëê° ìë¡ êµì²´ë  ë ì¤ë ë ê°ì ë¬¸ë§¥êµíì´ë¼ë ê²ì´ ë°ìíë¤. 
- ë¬¸ë§¥êµí : íì¬ê¹ì§ì ìì ìíë ë¤ì ììì íìí ê°ì¢ ë°ì´í°ë¥¼ ì ì¥íê³  ì½ì´ì¤ë ììì ê°ë¦¬í´ 
- ë¬¸ë§¥ êµíì ê±¸ë¦¬ë ìê°ì´ ì»¤ì§ìë¡ ë©í°ì¤ë ë©ì í¨ì¨ì ì íëë¤.
- ì¤íë ¤ ë§ì ìì ë¨ìí ê³ì°ì ì±ê¸ ì¤ë ëë¡ ëìíë ê²ì´ ë í¨ì¨ì ì¼ ì ìë¤. 
- ë°ë¼ì ë§ì ìì ì¤ë ëë¥¼ ì¤ííë ê²ì´ ì¸ì ë ì¢ì ì±ë¥ì ë³´ì´ë ê²ì ìëë¤. 
<br>
<br>

### 3. ì¤ë ë ê·¸ë£¹ 

- ì¤ë ë ê·¸ë£¹(thread group)ì´ë ìë¡ ê´ë ¨ì´ ìë ì¤ë ëë¥¼ íëì ê·¸ë£¹ì¼ë¡ ë¬¶ì´ ë¤ë£¨ê¸° ìí ì¥ì¹ë¤.
- ìë°ììë ì¤ë ë ê·¸ë£¹ì ë¤ë£¨ê¸° ìí´ ThreadGroupì´ë¼ë í´ëì¤ë¥¼ ì ê³µíë¤.
- ì´ë¬í ì¤ë ë ê·¸ë£¹ì ë¤ë¥¸ ì¤ë ë ê·¸ë£¹ì í¬í¨í  ìë ìì¼ë©°, ì´ë ê² í¬í¨ë ì¤ë ë ê·¸ë£¹ì í¸ë¦¬ ííë¡ ì°ê²°ëë¤.
ì´ë ì¤ë ëë ìì ì´ í¬í¨ë ì¤ë ë ê·¸ë£¹ì´ë ê·¸ íì ê·¸ë£¹ìë ì ê·¼í  ì ìì§ë§, ë¤ë¥¸ ê·¸ë£¹ìë ì ê·¼í  ì ìë¤.
ì´ë ê² ì¤ë ë ê·¸ë£¹ì ì¤ë ëê° ì ê·¼í  ì ìë ë²ìë¥¼ ì ííë ë³´ììì¼ë¡ë ì¤ìí ì­í ì íê³  ìë¤.

```java
class ThreadWithRunnable implements Runnable {
    public void run() {
        try {
            Thread.sleep(10); // 0.01ì´ê° ì¤ë ëë¥¼ ë©ì¶¤.
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}


public class Thread03 {
    public static void main(String[] args){
        Thread thread0 = new Thread(new ThreadWithRunnable());
        thread0.start(); // Thread-0 ì¤í
        System.out.println(thread0.getThreadGroup());

 
        ThreadGroup group = new ThreadGroup("myThread"); // myThreadë¼ë ì¤ë ë ê·¸ë£¹ ìì±í¨.
        group.setMaxPriority(7); // í´ë¹ ì¤ë ë ê·¸ë£¹ì ìµë ì°ì ììë¥¼ 7ë¡ ì¤ì í¨.

 
        // ì¤ë ëë¥¼ ìì±í  ë í¬í¨ë  ì¤ë ë ê·¸ë£¹ì ì ë¬í  ì ìì.
        Thread thread1 = new Thread(group, new ThreadWithRunnable());
        thread1.start(); // Thread-1 ì¤í
        System.out.println(thread1.getThreadGroup());
    }

// 	java.lang.ThreadGroup[name=main,maxpri=10]
// 	java.lang.ThreadGroup[name=myThread,maxpri=7]
 }
```
- ìì ìì ì²ë¼ main() ë©ìëìì ìì±ë ì¤ë ëì ê¸°ë³¸ ì¤ë ë ê·¸ë£¹ì ì´ë¦ì "main"ì´ ëë©°, ìµë ì°ì ììë 10ì¼ë¡ ìë ì¤ì ë©ëë¤.

<img src="/img/Thread.PNG" width="90%"></img>

**ì¤ë ë ê·¸ë£¹ì ì¬ì©íë ì´ì **

- ê·¸ë£¹ë´ í¬í¨ë ëª¨ë  ì¤ë ëë¤ì ì¼ê´ interrupt() ìì¼ì ìì íê² ì¢ë£í  ì ìë¤. ì¬ë¬ë² í ê±¸ íë²ì ê°ë¥íë¤ë ê².
- íì§ë§ ì¤ë ë ê·¸ë£¹ì interrupt() ë©ìëë ììë ì¤ë ëì interrupt() ë©ìëë¥¼ ì¤íë§ í ë¿ ê°ë³ ì¤ë ëì InterruptedException ìì¸ì²ë¦¬ë íì§ ìëë¤.

- ê°ë³ ì¤ë ëìì InterruptedException ì²ë¦¬ë¥¼ í´ì£¼ì´ì¼ íë¤.

```java
public class WorkThread extends Thread{
	public WorkThread(ThreadGroup threadGroup, String threadName) {
		super(threadGroup, threadName);
	}
	
	@Override
	public void run() {
		while(true) {
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				System.out.println(getName()+" interrupted");
				break;
			}
		}
		System.out.println(getName()+ " ì¢ë£ë¨");
	}
}

public class Main{
	public static void main(String[] args) {
		ThreadGroup myGroup = new ThreadGroup("myGroup");
		WorkThread workThreadA = new WorkThread(myGroup, "workThreadA");
		WorkThread workThreadB = new WorkThread(myGroup, "workThreadB");
		
		workThreadA.start();
		workThreadB.start();
		
		System.out.println("[main ì¤ë ë ê·¸ë£¹ì list() ë©ìë ì¶ë ¥ ë´ì©]");
		ThreadGroup mainGroup = Thread.currentThread().getThreadGroup(); //íì¬ì¤ë ëì ê·¸ë£¹
		mainGroup.list();
		
		System.out.println();
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {}
		
		System.out.println("[myGroup ì¤ë ë ê·¸ë£¹ì interrupted() ë©ìë í¸ì¶]");
		myGroup.interrupt();
	}
}
```


<br>
<br>

### 4. ì¤ë ë ëê¸°í ë©ìë, ëê¸°í ë¸ë­  
ë¬¸ì ìí©
```
Tread-1ì´ ê³µì ê°ì²´ì ë©¤ë²ë³ìì í ë¹ë ê°ì ë³ê²½. 
-> ê·¸ì¬ì´ Thread-2ê° ê³µì  ê°ì²´ì ë©¤ë²ë³ìì í ë¹ë ê°ì(nullì´ ìëì§ ëª¨ë¥´ê³ ) ìì´ì¹¨. 
-> Thread-1 ê³µì ê°ì²´ ì¬ì©íë ¤ëë° ê°ì´ë°ë. -> ì¤ë¥!!

ì´ë¥¼ ë°©ì§íê¸° ìí´ ë¨ íëì ì¤ë ëë§ì ì¤íí  ì ìë ìê³ìì­ì ì§ì í´ì¼ íë¤. 
ì¦, ê°ì²´ì ì ê¸ì ê±¸ì´ëì´ íëì ì¤ë ëë§ì´ ì ê·¼ê°ë¥íê³  ëë¨¸ì§ ì¤ë ëë ëê¸°íëë¡ ë§ë ë¤.
```



(1) ëê¸°í ë©ìë 
```java
public synchronized void method(){
	//ìê³ìì­; ë¨íëì ì¤ë ëë§ ì¤íê°ë¥.
}
```
- java synchronized
ë©í°ì¤ë ëë¥¼ ì ì¬ì©íë©´ íë¡ê·¸ë¨ì ì¼ë¡ ì¢ì ì±ë¥ì ë¼ ì ìì§ë§,
ë©í°ì¤ë ë íê²½ìì ë°ëì ê³ ë ¤í´ì¼í  ì ì¸ ì¤ë ëê° ëê¸°íë¼ë ë¬¸ì ë ê¼­ í´ê²°í´ì¼íë¤.
ìë¥¼ ë¤ì´ ì¤ë ëê° ìë¡ ê³µì íê³  ìì í  ì ìë dataê° ìëë° ì¤ë ëê° ëê¸°íê° ëì§ ìì ìíìì ë©í°ì¤ë ë íë¡ê·¸ë¨ì ëë¦¬ë©´, dataì ìì ì±ê³¼ ì ë¢°ì±ì ë³´ì¥í  ì ìë¤.
ë°ë¼ì dataì thread-safe ë¥¼ íê¸° ìí´ ìë°ììë synchronized í¤ìëë¥¼ ì ê³µí´ ì¤ë ëê° ëê¸°íë¥¼ ìì¼ dataì thread-safeë¥¼ ê°ë¥ì¼íë¤.
ìë°ìì ì§ìíë Synchronized í¤ìëë ì¬ë¬ê°ì ì¤ë ëê° íê°ì ììì ì¬ì©íê³ ì í  ë, íì¬ ë°ì´í°ë¥¼ ì¬ì©íê³  ìë í´ë¹ ì¤ë ëë¥¼ ì ì¸íê³  ëë¨¸ì§ ì¤ë ëë¤ì ë°ì´í°ì ì ê·¼ í  ì ìëë¡ ë§ë ê°ëì´ë¤.



- ex)
```java
package sync;

public class Calculator {
	private int memory;
	
	public int getMemory() {
		return memory;
	}
	//ëê¸°í ë©ìëë¡ ì ì¸íë ë°©ë²
	public synchronized void setMemory(int memory) { 
		this.memory = memory;
		try {
			Thread.sleep(2000);
		}catch(InterruptedException e) {}
		System.out.println(Thread.currentThread().getName()+" : "+this.memory);
	}
}
```


(2) ëê¸°í ë¸ë­ 
```java
public void method(){
	synchronized (ê³µì ê°ì²´){
    	//ìê³ìì­(ë¨ íëì ì¤ë ëë§ ì¤í ê°ë¥)
    }
    //ì¬ë¬ ì¤ë ëê° ì¤í ê°ë¥í ìì­.
}
```
- ex)
```java
package sync;

public class Calculator {
	private int memory;
	
	public int getMemory() {
		return memory;
	}
	
	// ì´ë ê² ëê¸°í ë¸ë­ì ì¬ì©í´ì ì²ë¦¬í  ì ìë¤.
	public void setMemory(int memory) {
		synchronized (this) {
			this.memory = memory;
			try {
				Thread.sleep(2000);
			}catch(InterruptedException e) {}
			System.out.println(Thread.currentThread().getName()+" : "+this.memory);
		}
	}
}
```

<br>
<br>

### 5. ì¤ë ë ìíì ì´  
- ì¤íì¤ì¸ ì¤ë ëì ìíë¥¼ ë³ê²½
- interrupt(), sleep(), join(), wait(), yield() notify(), notifyAll() ë±ì ë©ìëê° ì¡´ì¬.
- ì´ì¤ notify(), notifyAll(), wait() ë©ìëë Object í´ëì¤ì ë©ìëì´ê³  ëë¨¸ì§ë Thread í´ëì¤ì ë©ìë.

(1) sleep() : ì¼ìì ì§
-  ì¼ìì ì§ ìíìì interrupt() ë©ìëë¥¼ í¸ì¶í  ê²½ì° InterruptedExceptionì´ ë°ìë¨.
```java
try{
	Thread.sleep(1000); //1ì´ê° ì¼ìì ì§(ë°ë¦¬ì´ : 1000 -> 1ì´)
}catch(InterruptedException){
	//interrupt() ë©ìëê° í¸ì¶ëë©´ ì¤í.
}
```

(2) yield() : í ì¤ë ëì ì¤í ìë³´ 
- yield() ë©ìëë¥¼ í¸ì¶íë©´ í¸ì¶í ì¤ë ëë ì¤íëê¸°ìíë¡ ëìê°ê³  ëì¼í ì°ì ìì í¹ì ëì ì°ì ììë¥¼ ê°ë ë¤ë¥¸ ì¤ë ëê° ì¤í ê¸°íë¥¼ ê°ê²ë¨.
```java
public class ThreadA extends Thread{
	public boolean stop = false; //ì¢ë£ íëê·¸
	public boolean work = true; // ììì§íì¬ë¶
	
	public void run() {
		while(!stop) {
			if(work) {
				System.out.println("ThreadA ìì ë´ì©");
			}else {
				Thread.yield();
			}
		}
		System.out.println("ThreadA ì¢ë£");
	}
}
```
(3) join() : ë¤ë¥¸ ì¤ë ëì ì¢ë£ë¥¼ ê¸°ë¤ë¦¼
- ë¤ë¥¸ ì¤ë ëê° ì¢ë£ëì´ì¼ ì¤íí´ì¼íë ì¤ë ëê° ì¡´ì¬

- ê³ì°ììì´ ê·¸ ìì¸ë°, ê³ì°íì¬ ê²°ê³¼ë¥¼ return íë ì¤ë ëê° ì¡´ì¬íë©´ ê·¸ê²ì ì¶ë ¥íë ì¤ë ëê° íìíë°

- ê·¸ ë ì¶ë ¥ì¤ë ëê° ë¨¼ì  ìíëë©´ ì¤ë¥ì.
```java
public class SumThread extends Thread{
	private long sum;

	public long getSum() {
		return sum;
	}

	public void setSum(long sum) {
		this.sum = sum;
	}

	public void run() {
		for(int i =1; i<=100; i++) {
			sum+=i;
		}
	}
	
	@Override
	public String toString() {
		return "SumThread [sum=" + sum + "]";
	}
}

public class JoinExample {
	public static void main(String[] args) {
		SumThread sumThread = new SumThread();
		sumThread.start();
		
		try {
			sumThread.join();//íì¬ ì¤ë ë ê¸°ì¤ (ì´ë¶ë¶ì ì£¼ìì²ë¦¬í´ì ê²°ê³¼ë¥¼ ë¹êµí´ë³´ì¸ì)
		} catch (Exception e) {
		}
		System.out.println("1~100 í© : "+sumThread.getSum());
	}
}
```
(4) wait(), notify(). notifyAll() : ì¤ë ë ê° íë ¥ 
- ëê°ì ì¤ë ëë¥¼ ë²ê°ìê°ë©´ì ì¤í

- íµì¬ì ê³µì ê°ì²´ì íì©

- ë ì¤ë ëê° ììí  ë´ì©ì ëê¸°í ë©ìëë¡ êµ¬ë¶.

- ì¤ë ë1 ìì ìë£ -> notify() ë©ìë í¸ì¶ -> (ì¼ìì ì§)ì¤ë ë 2 ì¤íëê¸°ìíë¡ ë³ê²½ -> ì¤ë ë 1ì wait() (ì¼ìì ì§ ìí)

- ì´ë¤ ë©ìëë ëê¸°í ë©ìë í¹ì ëê¸°í ë¸ë¡ììë§ ì¬ì©ê°ë¥.
```java
//ê³µì ê°ì²´
public class WorkObject {
	public synchronized void methodA() {
		System.out.println("ThreadAì methodA() ìì ì¤í");
		notify(); //ì¼ìì ì§ ìíì ìë ThreadBë¥¼ ì¤íëê¸° ìíë¡ ë§ë¬.
		try {
			wait();//ThreadAë¥¼ ì¼ìì ì§ ìíë¡ ë§ë¬.
		} catch (Exception e) {
		}
	}
	
	public synchronized void methodB() {
		System.out.println("ThreadBì methodB() ìì ì¤í");
		notify(); //ì¼ìì ì§ ìíì ìë ThreadAë¥¼ ì¤íëê¸° ìíë¡ ë§ë¬.
		try {
			wait();//ThreadBë¥¼ ì¼ìì ì§ ìíë¡ ë§ë¬.
		} catch (Exception e) {
		}
	}
}

//Thread A
public class ThreadA extends Thread{
	private WorkObject workObject;
	
	public ThreadA(WorkObject workObject) {
		this.workObject = workObject;
	}
	
	@Override
	public void run() {
		for(int i =0; i<10; i++) {
			workObject.methodA();
		}
	}
}

//ThreadB
public class ThreadB extends Thread{
	private WorkObject workObject;
	
	public ThreadB(WorkObject workObject) {
		this.workObject = workObject;
	}
	
	@Override
	public void run() {
		for(int i =0; i<10; i++) {
			workObject.methodB();
		}
	}
}

//main ì¤ë ë
public class WaitNotifyExample {
	public static void main(String[] args) {
		WorkObject shareObject = new WorkObject(); //ê³µì ê°ì²´ ìì±
		
		ThreadA threadA = new ThreadA(shareObject);
		ThreadB threadB = new ThreadB(shareObject);//ThreadAì ThreadB ìì±
		
		threadA.start();
		threadB.start();
				
	}
}
```
- ë©ì¸ ì¤ë ëìì ê³µì ê°ì²´ë¥¼ ìì±

- ê°ê°ì ì¤ë ëì ë©¤ë²ë³ìë¡ ì´ê¸°í. ê³µì  ê°ì²´ì methodAì methodBë¥¼ ì¬ì©

- methodAì methodBë ë²ê°ìê°ë©´ì ì¤íëì´ì¼í¨.


(4) interrupt() : ì¤ë ëì ìì ì¢ë£ 
- run() ë©ìëê° ëª¨ë ì¤íëë©´ ì¤ë ëë ì¢ë£ë¨.

- ê¸°ì¡´ì stop() ì´ë ë©ìëê° ì ê³µëìì¼ë deprecated ëìë¤. -> ë¬¸ì 

- ì? -> ì¤ë ëê° ì¬ì©íë ììì´ ë¬¸ì ê° ë  ê°ë¥ì±( ììì´ë íì¼, ë¤í¸ìí¬ ì°ê²° ë±)

- interrupt() ë©ìëë¥¼ ì´ì©íì¬ ììë í´ì íë©° ìì íê² ì¢ë£í  ì ìì.
```java
public class PrintThread2 extends Thread{
	public void run() {
		try {
			while(true) {
				System.out.println("ì¤í ì¤");
				Thread.sleep(1);
				//if(Thread.interrupted()) {
				//if(Thread.currentThread().isInterrupted()) {
					//break;
				//}
			}
		} catch (InterruptedException e) {
			System.out.println("interrupt() ì¤í");
		}
		System.out.println("ìì ì ë¦¬");
		System.out.println("ì¤í ì¢ë£");
	}
}

//ë©ì¸ ì¤ë ë
public class InterruptExample {
	public static void main(String[] args) {
		Thread thread = new PrintThread2();
		thread.start();
		
		try {
			Thread.sleep(1000);
		} catch (Exception e) {
			
		}
		thread.interrupt();
	}
}
```

<br>
<br>

### 6. ì¤ë ëí
- ë³ë ¬ìì ì²ë¦¬ê° ë§ìì§ë©´ ì¤ë ë ê°ì ì¦ê° -> ì¤ë ë ìì± ë° ì¤ì¼ì¥´ë§ì CPUê° ë°ë¹ ì ¸ì ë©ëª¨ë¦¬ ë§ì´ ì¬ì©

- ê²°êµ­ ì±ë¥ì í.

- **ê°ìì¤ë° ë³ë ¬ ììì²ë¦¬ê° ë§ìì§ ë ì¤ë ëíì ì´ì©.**

- ì¤ë ëë¥¼ ì íë ê°ìë§í¼ ì í´ëê³  ììí(Queue)ì ë¤ì´ì¤ë ììë¤ì íëì© ì¤ë ëê° ë§¡ìì ì²ë¦¬.

- ì¤ë ëí ìì±/ì¬ì©ì ìí´ Executors í´ëì¤ì ExecutorService ì¸í°íì´ì¤ë¥¼ ì ê³µ.

- Executorsì ë¤ìí ì ì ë©ìëë¡ ExecutorServiceì êµ¬íê°ì²´ë¥¼ ë§ë¤ ì ìëë° ì´ê²ì´ ë°ë¡ ì¤ë ëí.

**(1) ì¤ë ëí ìì±**

Executors í´ëì¤
- newCachedThreadPool()

- newFixedThreadPool()
```java
ExecutorService executorService = Executors.newCachedThreadPool();

ExecutorService executorService2 = Executors.newFixedThreadPool(
	Runtime.getRuntime().availableProcessors();
); //cpuì ì½ì´ìë§í¼ ìµëì¤ë ëí ìì±
```
**(2) ì¤ë ëí ì¢ë£**
```java
executorService.shutdown() - ë¨ììë ììì ë§ë¬´ë¦¬íê³  ì¤ë ëí ì¢ë£
executorService.shutdownNow() - ë¨ììë ììê³¼ë ìê´ìì´ ê°ì ë¡ ì¢ë£
```

**(2) ììì²ë¦¬ìì²­**
- ExecutorServiceì ììíì Runnable í¹ì Callableê°ì²´ë¥¼ ë£ë íì
- ììì²ë¦¬ ìì²­ì ìí´ submit()ê³¼ execute() ë©ìëë¥¼ ì ê³µí¨.

- execute() : Runnableì ììíì ì ì¥

- submit() : Runnable ëë Callableì ììíì ì ì¥, Future ê°ì²´ë¥¼ ë¦¬í´

- **submit ë©ìëë¥¼ ì¬ì©íë ê²ì´ ì¤ë ëì ìì±ì¤ë²í¤ëë¥¼ ì¤ì´ëë° ì¢ë¤**. ìëíë©´ executeë©ìëë ììì²ë¦¬ì¤ ìì¸ê° ë°ìíë©´ ì°ë ì¤ë ëë¥¼ ë²ë¦¬ê³  ìë¡ì´ ì¤ë ëë¥¼ ìì±íë¤. íì§ë§ submit ë©ìëë ì°ë ì¤ë ëë¥¼ ì¬íì©íë¤.
```java
public static void main(String[] args) throws Exception{
		ExecutorService executorService = Executors.newFixedThreadPool(2); //ìµëì¤ë ë ê°ìê° 2ì¸ ì¤ë ëí ìì±
		
		for(int i =0; i<10; i++) {
			Runnable runnable = new Runnable() {

				@Override
				public void run() {
					ThreadPoolExecutor threadPoolExecutor = (ThreadPoolExecutor) executorService;
					int poolSize = threadPoolExecutor.getPoolSize();
					String threadName = Thread.currentThread().getName();
					System.out.println("[ì´ ì¤ë ë ê°ì : "+poolSize+"] ìì ì¤ë ë ì´ë¦ :"+threadName);
					
					//ìì¸ ë°ììí´
					int value = Integer.parseInt("ì¼");
				}
			};	
            //ì´ ëê°ë¥¼ ë²ê°ìê°ë©´ì ì¤íí´ë³´ì¸ì.
			//executorService.execute(runnable);
			executorService.submit(runnable);
			
			Thread.sleep(10);//ì½ì ì¶ë ¥ìê°ì ìí´ 0.01ì´ ì¼ìì ì§
		}
		executorService.shutdown();
	}
```


<br>
<br>


### 7. ë°ëª¬ì¤ë ë 

- ë°ëª¬ ì¤ë ë(deamon thread)ë ë¤ë¥¸ ì¼ë° ì¤ë ëì ììì ëë ë³´ì¡°ì ì¸ ì­í ì íë ì¤ë ëë¥¼ ê°ë¦¬í¨ë¤.
ë°ë¼ì ë°ëª¬ ì¤ë ëë ì¼ë° ì¤ë ëê° ëª¨ë ì¢ë£ëë©´ ëë í  ì¼ì´ ìì¼ë¯ë¡, ë°ëª¬ ì¤ë ë ì­ì ìëì¼ë¡ ì¢ë£ëë¤.
ë°ëª¬ ì¤ë ëì ìì± ë°©ë²ê³¼ ì¤í ë°©ë²ì ëª¨ë ì¼ë° ì¤ë ëì ê°ë¤.
ë¨, ì¤ííê¸° ì ì setDaemon() ë©ìëë¥¼ í¸ì¶íì¬ ë°ëª¬ ì¤ë ëë¡ ì¤ì íê¸°ë§ íë©´ ëë¤.
ì´ë¬í ë°ëª¬ ì¤ë ëë ì¼ì  ìê°ë§ë¤ ìëì¼ë¡ ìíëë ì ì¥ ë° íë©´ ê°±ì  ë±ì ì´ì©ëê³  ìë¤.

<br>
<br>
<hr>

## â 6. Springì Thread ì ì© 

### 1. ë°©í¥ì± 
- ë¤ì¤ì¼ë¡ taskê´ë¦¬ 
- pool ê´ë¦¬ 
- exception ê´ë¦¬ 

### 2. íë¦ 
- AsyncConfigurer ì¬ì©, ThreadPoolTaskExecutor íì©íì¬ Executorë¥¼ ë¤ì¤ì¼ë¡ ìì±
- AsyncConfigurer ë¥¼ ì¬ì©íê¸° ëë¬¸ì ExceptionHandler ì°ê²°ì´ ê°ë¥ 
- @Async ë¥¼ íì©í´ì ì¬ë¬ Threadë¥¼ ìì±í´ íìí Executor ê³¼ ì°ê²°íì¬ ì¬ì©íë¤.
- ThreadPoolTaskExecutor ë¥¼ ì¬ì©í ì´ì ë ê°ì¥ ë³´í¸ì ì´ë©° ëìì pool ê´ë¦¬ë¥¼ í  ì ìê¸° ëë¬¸ì´ë¤.

### 3. ìì 
(1) ë¨¼ì  í´ëì¤ ìì±í´ì¼ë¨ 
```java
@Configuration				// @Configuration ë¥¼ íì©íì¬ bean ê°ì²´ ë±ë¡
@EnableAsync				// @EnableAsync
public class AsyncConfig implements AsyncConfigurer {	// AsyncConfigurer ë¥¼ ììë°ìì AsyncConfig êµ¬í
```

(2) Executor ì ì¬ì©í  ë³ìë¤ ììí
```java
    /** ìí ê¸°ë³¸ Thread ì */
    private static int TASK_SAMPLE_CORE_POOL_SIZE = 2;
    /** ìí ìµë Thread ì */
    private static int TASK_SAMPLE_MAX_POOL_SIZE = 5;
    /** ìí QUEUE ì */
    private static int TASK_SAMPLE_QUEUE_CAPACITY = 0;
    /** ìí Thread Bean Name */
    private static String EXECUTOR_SAMPLE_BEAN_NAME = "executorSample";
    /** ìí Thread */
    @Resource(name = "executorSample")
    private ThreadPoolTaskExecutor executorSample;
```


(3) AsyncConfigurer ìì ë°ì í´ëì¤ë¥¼ ë§ë¤ë©´ @Override í´ì¼íë í¨ì 2ê° ì¡´ì¬
- 1. getAsyncExecutor 
- 2. Executor 
```java
@Bean(name = "executorSample")			// Bean Name ì¶ê°
@Override
public Executor getAsyncExecutor() {
	ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
	executor.setCorePoolSize(TASK_SAMPLE_CORE_POOL_SIZE);	//pool size ì§ì 
	executor.setMaxPoolSize(TASK_SAMPLE_MAX_POOL_SIZE);	//ìµë pool size ì§ì 
	executor.setQueueCapacity(TASK_SAMPLE_QUEUE_CAPACITY);	//queue size ì§ì 
	executor.setBeanName(EXECUTOR_SAMPLE_BEAN_NAME);	// bean name ì§ì  
	executor.initialize();
	return executor;
}
```

(4) getAsyncUncaughtExceptionHandler í¨ì : ExceptionHandler ì°ê²°íë í¨ì 
```java
  @Override
    public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {
        // TODO Auto-generated method stub
        return null;
    }
```

(5) taskë¥¼ ìì±íê¸° ì ì poolì´ ëª¨ë ì°¼ëì§ë¥¼ ì²´í¬íë í¨ì(ìëµê°ë¥)
```java
    /**
     * ìí Thread ë±ë¡ ê°ë¥ ì¬ë¶
     *
     * @return ì¤íì¤ì¸ task ê°ìê° ìµë ê°ì(max + queue)ë³´ë¤ í¬ê±°ë ê°ì¼ë©´ false
     */
    public boolean isSampleTaskExecute() {
        boolean rtn = true;
 
        System.out.println("EXECUTOR_SAMPLE.getActiveCount() : " + executorSample.getActiveCount());
 
        // ì¤íì¤ì¸ task ê°ìê° ìµë ê°ì(max + queue)ë³´ë¤ í¬ê±°ë ê°ì¼ë©´ false
        if (executorSample.getActiveCount() >= (TASK_SAMPLE_MAX_POOL_SIZE + TASK_SAMPLE_QUEUE_CAPACITY)) {
            rtn = false;
        }
 
        return rtn;
    }
 
    /**
     * ìí Thread ë±ë¡ ê°ë¥ ì¬ë¶
     *
     * @param createCnt : ìì± ê°ì
     * @return ì¤íì¤ì¸ task ê°ì + ì¤íí  ê°ìê° ìµë ê°ì(max + queue)ë³´ë¤ í¬ë©´ false
     */
    public boolean isSampleTaskExecute(int createCnt) {
        boolean rtn = true;
 
        // ì¤íì¤ì¸ task ê°ì + ì¤íí  ê°ìê° ìµë ê°ì(max + queue)ë³´ë¤ í¬ê±°ë ê°ì¼ë©´ false
        if ((executorSample.getActiveCount() + createCnt) > (TASK_SAMPLE_MAX_POOL_SIZE + TASK_SAMPLE_QUEUE_CAPACITY)) {
            rtn = false;
        }
 
        return rtn;
    }
```
<br>

 **ë¤ì¤ ìì±ì ìí´ íë ë ì¶ê°í ì ì²´ ì½ë**

 AsyncConfig.java
```java
import java.util.concurrent.Executor;
 
import javax.annotation.Resource;
 
import org.springframework.aop.interceptor.AsyncUncaughtExceptionHandler;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.AsyncConfigurer;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
 
@Configuration
@EnableAsync
public class AsyncConfig implements AsyncConfigurer {
    /** ìí ê¸°ë³¸ Thread ì */
    private static int TASK_SAMPLE_CORE_POOL_SIZE = 2;
    /** ìí ìµë Thread ì */
    private static int TASK_SAMPLE_MAX_POOL_SIZE = 5;
    /** ìí QUEUE ì */
    private static int TASK_SAMPLE_QUEUE_CAPACITY = 0;
    /** ìí Thread Bean Name */
    private static String EXECUTOR_SAMPLE_BEAN_NAME = "executorSample";
    /** ìí Thread */
    @Resource(name = "executorSample")
    private ThreadPoolTaskExecutor executorSample;
 
    /** ê¸°í ê¸°ë³¸ Thread ì */
    private static int TASK_ETC_CORE_POOL_SIZE = 5;
    /** ê¸°í ìµë Thread ì */
    private static int TASK_ETC_MAX_POOL_SIZE = 10;
    /** ê¸°í QUEUE ì */
    private static int TASK_ETC_QUEUE_CAPACITY = 0;
    /** ê¸°í Thread Bean Name */
    private static String EXECUTOR_ETC_BEAN_NAME = "executorEtc";
    /** ê¸°í Thread */
    @Resource(name = "executorEtc")
    private ThreadPoolTaskExecutor executorEtc;
 
    /**
     * ìí Thread ìì±
     *
     * @return
     */
    @Bean(name = "executorSample")
    @Override
    public Executor getAsyncExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(TASK_SAMPLE_CORE_POOL_SIZE);
        executor.setMaxPoolSize(TASK_SAMPLE_MAX_POOL_SIZE);
        executor.setQueueCapacity(TASK_SAMPLE_QUEUE_CAPACITY);
        executor.setBeanName(EXECUTOR_SAMPLE_BEAN_NAME);
        executor.initialize();
        return executor;
    }
 
    /**
     * ìí Thread ë±ë¡ ê°ë¥ ì¬ë¶
     *
     * @return ì¤íì¤ì¸ task ê°ìê° ìµë ê°ì(max + queue)ë³´ë¤ í¬ê±°ë ê°ì¼ë©´ false
     */
    public boolean isSampleTaskExecute() {
        boolean rtn = true;
 
        System.out.println("EXECUTOR_SAMPLE.getActiveCount() : " + executorSample.getActiveCount());
 
        // ì¤íì¤ì¸ task ê°ìê° ìµë ê°ì(max + queue)ë³´ë¤ í¬ê±°ë ê°ì¼ë©´ false
        if (executorSample.getActiveCount() >= (TASK_SAMPLE_MAX_POOL_SIZE + TASK_SAMPLE_QUEUE_CAPACITY)) {
            rtn = false;
        }
 
        return rtn;
    }
 
    /**
     * ìí Thread ë±ë¡ ê°ë¥ ì¬ë¶
     *
     * @param createCnt : ìì± ê°ì
     * @return ì¤íì¤ì¸ task ê°ì + ì¤íí  ê°ìê° ìµë ê°ì(max + queue)ë³´ë¤ í¬ë©´ false
     */
    public boolean isSampleTaskExecute(int createCnt) {
        boolean rtn = true;
 
        // ì¤íì¤ì¸ task ê°ì + ì¤íí  ê°ìê° ìµë ê°ì(max + queue)ë³´ë¤ í¬ê±°ë ê°ì¼ë©´ false
        if ((executorSample.getActiveCount() + createCnt) > (TASK_SAMPLE_MAX_POOL_SIZE + TASK_SAMPLE_QUEUE_CAPACITY)) {
            rtn = false;
        }
 
        return rtn;
    }
 
    /**
     * ê¸°í Thread ìì±
     *
     * @return
     */
    @Bean(name = "executorEtc")
    @Qualifier
    public Executor taskExecutorEtc() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(TASK_ETC_CORE_POOL_SIZE);
        executor.setMaxPoolSize(TASK_ETC_MAX_POOL_SIZE);
        executor.setQueueCapacity(TASK_ETC_QUEUE_CAPACITY);
        executor.setBeanName(EXECUTOR_ETC_BEAN_NAME);
        executor.initialize();
        return executor;
    }
 
    /**
     * ê¸°í Thread ë±ë¡ ê°ë¥ ì¬ë¶
     *
     * @return ì¤íì¤ì¸ task ê°ìê° ìµë ê°ì(max + queue)ë³´ë¤ í¬ê±°ë ê°ì¼ë©´ false
     */
    public boolean isEtcTaskExecute() {
        boolean rtn = true;
 
        // ì¤íì¤ì¸ task ê°ìê° ìµë ê°ì(max + queue)ë³´ë¤ í¬ê±°ë ê°ì¼ë©´ false
        if (executorEtc.getActiveCount() >= (TASK_ETC_MAX_POOL_SIZE + TASK_ETC_QUEUE_CAPACITY)) {
            rtn = false;
        }
 
        return rtn;
    }
 
    /**
     * ê¸°í Thread ë±ë¡ ê°ë¥ ì¬ë¶
     *
     * @param createCnt : ìì± ê°ì
     * @return ì¤íì¤ì¸ task ê°ì + ì¤íí  ê°ìê° ìµë ê°ì(max + queue)ë³´ë¤ í¬ë©´ false
     */
    public boolean isEtcTaskExecute(int createCnt) {
        boolean rtn = true;
 
        // ì¤íì¤ì¸ task ê°ì + ì¤íí  ê°ìê° ìµë ê°ì(max + queue)ë³´ë¤ í¬ê±°ë ê°ì¼ë©´ false
        if ((executorEtc.getActiveCount() + createCnt) > (TASK_ETC_MAX_POOL_SIZE + TASK_ETC_QUEUE_CAPACITY)) {
            rtn = false;
        }
 
        return rtn;
    }
 
    /* (non-Javadoc)
     * @see org.springframework.scheduling.annotation.AsyncConfigurer#getAsyncUncaughtExceptionHandler()
     */
    @Override
    public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {
        return new AsyncExceptionHandler();
    }
}
```


(6) ìì±ë Executor ì¸ executorSample ê³¼ ì°ê²°í  AsyncTask class íì¼
```java
@Service("asyncTaskSample")
public class AsyncTaskSample {

}
```
(7) task ìì± 
- ë¦¬í´íìì voidì Future<String> ë ê°ì§ë¡ ìì± ê°ë¥
- @Async ì¬ì©ì ì ì½ì¬í­
  - 1. í¨ìë ë¬´ì¡°ê±´ public íìì´ì´ì¼ íë¤.
  - 2. ê°ì í´ëì¤ ììì ìíí¸ì¶ ì ë¨. 
```java
    @Async("executorSample") 
	//@Async ë¥¼ ì¬ì©í´ì ë¹ëê¸° ë©ìëë¼ê³  ì ì¸íê³  ì°ê²°í  Executor ëªì ì ì´ì¤ë¤.

    public void executorSample(String str) {
        // LOG : ìì ìë ¥
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD START");
        
        // ë´ì©
        // ë´ì©
        // ë´ì©
        
        // LOG : ì¢ë£ ìë ¥
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD END");
    }
 
    @Async("executorSample")
	//@Async ë¥¼ ì¬ì©í´ì ë¹ëê¸° ë©ìëë¼ê³  ì ì¸íê³  ì°ê²°í  Executor ëªì ì ì´ì¤ë¤.

    public void executorSample2(String str) {
        // LOG : ìì ìë ¥
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD START");
        
        // ë´ì©
        // ë´ì©		ë¹ëê¸°ë¡ í  ììì ì½ë©íê±°ë í¨ìë¥¼ í¸ì¶íë©´ ë¨ 
        // ë´ì©
        
        // LOG : ì¢ë£ ìë ¥
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD END");
    }
```

**ì ì²´ ì½ë**

AsyncTaskSample.java
```java
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
 
/**
 * @Title      : AsyncTaskSample ê´ë¦¬
 * @Filename   : AsyncTaskSample.java
 */
@Service("asyncTaskSample")
public class AsyncTaskSample {
    
    /**
     * ìë®¬ë ì´ì íì¤í¸ì© í¨ì
     *
     * @param str
     */
    @Async("executorSample")
    public void executorSample(String str) {
        // LOG : ìì ìë ¥
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD START");
        
        // ë´ì©
        // ë´ì©
        // ë´ì©
        
        // LOG : ì¢ë£ ìë ¥
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD END");
    }
    
    /**
     * ìë®¬ë ì´ì íì¤í¸ì© í¨ì2
     *
     * @param str
     */
    @Async("executorSample")
    public void executorSample2(String str) {
        // LOG : ìì ìë ¥
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD START");
        
        // ë´ì©
        // ë´ì©
        // ë´ì©
        
        // LOG : ì¢ë£ ìë ¥
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD END");
    }
}
```

AsyncTaskEtc.java
```java
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
 
/**
 * @Title      : AsyncTaskEtc ê´ë¦¬
 * @Filename   : AsyncTaskEtc.java
 */
@Service("asyncTaskEtc")
public class AsyncTaskEtc {
    
    /**
     * ê¸°í ì¤ë ë íì¤í¸ì© í¨ì
     *
     * @param str
     */
    @Async("executorEtc")
    public void executorEtc(String str) {
        // LOG : ìì ìë ¥
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD START");
        
        // ë´ì©
        // ë´ì©
        // ë´ì©
        
        // LOG : ì¢ë£ ìë ¥
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD END");
    }
    
    /**
     * ê¸°í ì¤ë ë íì¤í¸ì© í¨ì2
     *
     * @param str
     */
    @Async("executorEtc")
    public void executorEtc2(String str) {
        // LOG : ìì ìë ¥
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD START");
 
        // ë´ì©
        // ë´ì©
        // ë´ì©
        
        // LOG : ì¢ë£ ìë ¥
        // ...
        System.out.println("==============>>>>>>>>>>>> THREAD END");
    }
}
```
	
<br>
<br>
<hr>

## â 7. ë¡ê·¸ìì í ë¤ë¡ê°ê¸° ë°©ì§  

### 1. ì¤ì ì¼ë¡ í´ê²°
```java
<mvc:interceptor>
    <mvc:mapping path="/**/*" />
    <beans:bean id="webContentInterceptor" class="org.springframework.web.servlet.mvc.WebContentInterceptor">
	<beans:property name="cacheSeconds" value="0" />

          <beans:property name="useExpiresHeader" value="true" />
	<beans:property name="useCacheControlHeader" value="true" />
	<beans:property name="useCacheControlNoStore" value="true" />
    </beans:bean>
</mvc:interceptor>	
```
### 2. ì¤í¬ë¦½í¸ë¡ ë§ê¸°
- script
```java
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
```
- body
```java
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">	
```
	
	<br>
<br>
<hr>

## â 8. í¹ì  íì¥ì íì¼ 
```java
										<c:when test="${empty update.programId || update.programId eq ''}">
											<div class="area_filebox">
												<input type="text" class="upload_name" disabled="disabled" title="ì²¨ë¶íì¼ëªì´ íìë©ëë¤.">
												<label for="menu_item09">íì¼ì°¾ê¸°</label>
												<input type="file" class="upload_hidden" id="menu_item09" name="programImageFile" onchange="fileExtChange()" value="${update.programImage}" title="íë¡ê·¸ë¨ ì´ë¯¸ì§">
											</div>	
```

```java
	function fileExtChange() {
		var fileName = $("input[name=programImageFile]").val();
		var fileExt = fileName.split(".")[1];

		if(fileExt == "jpg" || fileExt == "png" || fileExt == "bmp" || fileExt == "gif" || fileExt == "tif" || fileExt == "JPG" || fileExt == "PNG" || fileExt == "BMP" || fileExt == "GIF" || fileExt == "TIF") {}
		else {
			$("input[name=programImageFile]").val("");
			$(".upload_name").val("");
			alert("ì´ë¯¸ì§ íì¥ìë§ ì²¨ë¶ ê°ë¥í©ëë¤.");
			return false;
		}
	}	
```
											
											
<br>
<br>
<hr>

## â 9. input number maxlength ì ì©íê¸°
```java
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
   
  function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
  }
  
</script>

<input type="number" maxlength="4" oninput="maxLengthCheck(this)"/>											
											
```
