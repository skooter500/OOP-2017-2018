using UnityEngine;

public class EnemyManager : MonoBehaviour {

    public int targetCount = 5;
    public float radius = 10;
    public GameObject enemyPrefab;


    // This is called a coroutine. Coroutines allow us to write code that happens on a timer rather than every frame
    // Check out this tutorial https://unity3d.com/learn/tutorials/topics/scripting/coroutines
    System.Collections.IEnumerator SpawnTanks()
    {
        yield return new WaitForSeconds(3); // Suspend this coroutine for 3 seconds
        while (true)
        {
            GameObject[] enemies = GameObject.FindGameObjectsWithTag("Enemy");

            // Try and ensure there are always targetCount enemies in the scene
            if (enemies.Length < targetCount)
            {
                GameObject enemy = GameObject.Instantiate(enemyPrefab);
                Vector2 c = Random.insideUnitCircle * radius;
                enemy.transform.position = new Vector3
                    (c.x
                    , 5
                    , c.y
                );
            }
            yield return new WaitForSeconds(2); // Suspend for 2 seconds
        }
    }

	// Use this for initialization
	void Start () {
        StartCoroutine(SpawnTanks());

    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
