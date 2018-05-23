import time
from metaappscriptsdk import MetaApp

META = MetaApp()
log = META.log

META.worker.debug_tasks = [{
    "data": {
    }
}]

meta_samples_db = META.db("meta_samples")


def process_org(org):
    log.info("process_org", {"org": org})
    time.sleep(5)


@META.worker.single_task
def main(task):
    log.info("task", {"task": task})
    orgs = meta_samples_db.all("SELECT * FROM organization ORDER BY name")

    for org in orgs:
        process_org(org)
