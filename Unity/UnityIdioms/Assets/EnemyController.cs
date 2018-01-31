using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyController : MonoBehaviour {

    public void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == "Bullet")
        {
            Debug.Log("Collision");
            ExplodeMyParts();
        }
    }

    private void ExplodeMyParts()
    {
        // Get all my component gameobjects
        foreach (Transform t in this.GetComponentsInChildren<Transform>())
        {
            // If it doesnt have a rigidbody add one. Rigidbody's are used to implement physics
            Rigidbody rb = t.gameObject.GetComponent<Rigidbody>();
            if (rb == null)
            {
                rb = t.gameObject.AddComponent<Rigidbody>();
            }
            rb.useGravity = true;
            rb.isKinematic = false;
            Vector3 v = new Vector3(
                Random.Range(-5, 5)
                , Random.Range(5, 10)
                , Random.Range(-5, 5)
                );
            // Give it a random velocity
            rb.velocity = v;
        }
        // Call Sink after 4 seconds
        Invoke("Sink", 4);

        // Destroy the gameobject after 5 seconds
        Destroy(this.gameObject, 7);
    }

    void Sink()
    {
        // Disable the collider so it no longer collides with the ground. Gravity will cause it to sink
        GetComponent<Collider>().enabled = false;
        // Changes how much drag the object has. Higher numbers make it sink slower
        GetComponent<Rigidbody>().drag = 1;
    }

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
