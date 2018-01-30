using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Sink : MonoBehaviour {

	// Use this for initialization
	void Start () {
        StartCoroutine(SinkMe());
	}

    System.Collections.IEnumerator SinkMe()
    {
        yield return new WaitForSeconds(3);
        GetComponent<Rigidbody>().isKinematic = true;
        while (true)
        {
            transform.Translate(0, -Time.deltaTime, 0, Space.World);
            if (transform.position.y < -3)
            {
                Destroy(this.gameObject);
            }
            yield return null;
        }
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
