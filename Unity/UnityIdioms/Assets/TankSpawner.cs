using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TankSpawner : MonoBehaviour {

    public GameObject tankPrefab;

    void Awake()
    {
        StartCoroutine(KeepTanksAlive());
    }

    System.Collections.IEnumerator KeepTanksAlive()
    {
        yield return new WaitForSeconds(3);
        while (true)
        {
            GameObject[] aiTanks = GameObject.FindGameObjectsWithTag("aiTank");
            if (aiTanks.Length < 5)
            {
                GameObject newTank = GameObject.Instantiate<GameObject>(tankPrefab);
                newTank.GetComponent<Rigidbody>().isKinematic = false;
                newTank.GetComponent<Rigidbody>().useGravity = true;
                Vector3 newPos = transform.position;
                newPos.x = newPos.x + Random.Range(-5, 5);
                newPos.y = 5;
                newPos.z = newPos.z + Random.Range(-5, 5);
                newTank.transform.position = newPos;
            }
            yield return new WaitForSeconds(2);
        }
    }


	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
